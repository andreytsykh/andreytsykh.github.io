public without sharing class LayoutController {
	
	private static Set<String> fieldsFromFieldSets;
	private static Settings settings;
	private static String recordIdString;
	private static Schema.SObjectType targetType;
	
	private static sObject currentSobject {
		get {
			if (currentSobject == null) {
				currentSobject = getCurrentSobject(recordIdString);
				settings.currentSobjectRecord = currentSobject;
				system.debug('currentSobject ' + currentSobject);
			}
			return currentSobject;
		}
		set;
	}
	
    @AuraEnabled
    public static Wrapper refreshSobject(sObject incomeSobject) {
    	currentSobject = incomeSobject;
    	recordIdString = String.valueOf(currentSobject.get('Id'));
    	return getSections(recordIdString);
    }
    
    @AuraEnabled
    public static String updateSobject(sObject currentSobject) {
    	String result = 'success';
    	try {
    		update currentSobject;
    	} catch(Exception e) {
    		//throw new AuraHandledException(e.getMessage());
    		result = e.getMessage();
    		system.debug('updateSobject ' + e.getMessage());
    	}
    	return result;
    }
    
    @AuraEnabled
    public static Wrapper getSections(String recordId) {
    	recordIdString = recordId;
    	settings = new Settings();
    	List<LightningSection> result = new List<LightningSection>();
    	settings.objectApiName = Id.valueOf(recordId).getSObjectType().getDescribe().getName();
    	Schema.SObjectType targetType = Schema.getGlobalDescribe().get(settings.objectApiName);
        settings.sObjectDescribe = targetType.getDescribe();
        settings.fieldDescribeMap = settings.sObjectDescribe.fields.getMap();
        Map<String, Schema.FieldSet> fieldSetMap = settings.sObjectDescribe.fieldSets.getMap();
        settings.recordTypeName = getCurrentSobjectRecordTypeName(settings.objectApiName, recordId);
    	
        
        List<Layout_Sections__mdt> layouts = [
        	SELECT Id, MasterLabel, Field_Set_Name_left__c, Field_Set_Name_right__c, Position__c, Record_Type_Name__c
        	FROM Layout_Sections__mdt
        	WHERE ObjectApiName__c =: settings.objectApiName
        	AND Record_Type_Name__c = :settings.recordTypeName
        	ORDER BY Position__c ASC
        ];
        
        
    	//system.debug('layouts ' + layouts);
        
        fillFieldsFromFieldSets(layouts, fieldSetMap);
	        
        List<Field_Settings__mdt> fieldSettings = [
        	SELECT Id, MasterLabel, Field_API_Name__c, Field_Values__c, ReadOnly_Fields__c, Required_Fields__c
        	FROM Field_Settings__mdt
        	WHERE Object_API_Name__c = :settings.objectApiName
        	AND Field_API_Name__c IN :fieldsFromFieldSets
        	AND Record_Type_Name__c = :settings.recordTypeName
    	];
    	
    	//system.debug('fieldSettings ' + fieldSettings);
    	
    	setDependentPicklistSettings();
    	setFieldSettings(fieldSettings, currentSobject);
    	settings.currentSobjectRecord = currentSobject;
    	setSharingSettings();
    	
    	List<Restricted_Picklist__mdt> restrictedPicklistSettings = [
        	SELECT Id, Field_API_Name__c, Picklist_values__c, Record_Type_Name__c
        	FROM Restricted_Picklist__mdt
        	WHERE Object_API_Name__c =: settings.objectApiName
        	AND Picklist_values__c != null
        	AND Record_Type_Name__c = :settings.recordTypeName
    	];
    	
    	//system.debug('restrictedPicklistSettings ' + restrictedPicklistSettings);
    	
    	for (Restricted_Picklist__mdt restrictedPicklistSetting : restrictedPicklistSettings) {
    		settings.fieldName_PicklistValues.put(restrictedPicklistSetting.Field_API_Name__c, restrictedPicklistSetting);
    	}
    	
    	//system.debug('settings.fieldName_PicklistValues ' + settings.fieldName_PicklistValues);
        
        if (layouts.size() > 0) {
        	
        	for (Layout_Sections__mdt layout : layouts) {
        		List<FieldSetMember> leftFields = getFields(fieldSetMap.get(layout.Field_Set_Name_left__c));
        		List<FieldSetMember> rightFields = getFields(fieldSetMap.get(layout.Field_Set_Name_right__c));
	        	LightningSection section = new LightningSection(layout.MasterLabel, leftFields, rightFields);
	    		result.add(section);
        	}
	        
	        Wrapper resultWrapper = new Wrapper(result, currentSobject, settings.objectApiName, settings.fiedValuesNotDisplayed);
	        
	        return resultWrapper;
        }
        
        return null;
    }
	
	private static sObject getCurrentSobject(String recordId) {
		
		system.debug('settings.controlledPicklists ' + settings.controlledPicklists);
		system.debug('fieldsFromFieldSets ' + fieldsFromFieldSets);
		Set<String> hiddenFields = new Set<String>();
		
		List<String> fieldsList = new List<String>(fieldsFromFieldSets);
		for (String fieldName : settings.controlledPicklists) {
			if (!fieldsFromFieldSets.contains(fieldName)) {
				fieldsList.add(fieldName);
				hiddenFields.add(fieldName);
			}
		}
		
		String query = String.format(
			'SELECT {0} FROM {1} WHERE Id = :recordId',
			new String[]{
				String.join(new List<String>(fieldsList), ','),
				settings.objectApiName
			}
		);
		system.debug('query ' + query);
		
		sObject result = Database.query(query);
		
		for (String field : hiddenFields) {
			settings.fiedValuesNotDisplayed.put(field, String.valueOf(result.get(field)));
		}
		
		system.debug('settings.fiedValuesNotDisplayed ' + settings.fiedValuesNotDisplayed);
		
		return result;
	}
	
	private static String getCurrentSobjectRecordTypeName(String objectApiName, String recordId) {
		List<Schema.RecordTypeInfo> recordTypeInfos = settings.sObjectDescribe.getRecordTypeInfos();
		if (recordTypeInfos.size() > 1) {
			try {
				String recordTypeId = String.valueOf(Database.query(
					String.format(
						'SELECT RecordTypeId FROM {0} WHERE Id = :recordId',
						new String[]{
							objectApiName
						}
					)
				)[0].get('RecordTypeId'));
				
				for (Schema.RecordTypeInfo recordTypeInfo : recordTypeInfos) {
					if (recordTypeInfo.RecordTypeId == Id.valueOf(recordTypeId)) {
						return recordTypeInfo.Name;
					}
				}
			} catch(Exception e){
				system.debug('getCurrentSobjectRecordTypeName ' + e.getMessage());
			}
		}
		return null;
	}
	
    private static List<FieldSetMember> getFields(Schema.FieldSet fieldSet) {
    	
        List<FieldSetMember> result = new List<FieldSetMember>();
        
        if (fieldSet != null) {
	        List<Schema.FieldSetMember> fieldSetMembersSchema = fieldSet.getFields();
	        for (Schema.FieldSetMember fieldSetMember : fieldSetMembersSchema) {
	            result.add(new FieldSetMember(fieldSetMember, settings));
	        }
        }
        
        return result;
    }
    
    private static void fillFieldsFromFieldSets(List<Layout_Sections__mdt> layouts, Map<String, Schema.FieldSet> fieldSetMap) {
    	
    	fieldsFromFieldSets = new Set<String>();
    	
    	for (Layout_Sections__mdt layout : layouts) {
        	Schema.FieldSet fieldSetRight = fieldSetMap.get(layout.Field_Set_Name_right__c);
        	Schema.FieldSet fieldSetLeft = fieldSetMap.get(layout.Field_Set_Name_left__c);
        	if (fieldSetLeft != null) {
		        List<Schema.FieldSetMember> fieldSetMembersSchema = fieldSetLeft.getFields();
		        for (Schema.FieldSetMember fieldSetMember : fieldSetMembersSchema) {
		            fieldsFromFieldSets.add(fieldSetMember.fieldPath);
		        }
	        }
        	if (fieldSetRight != null) {
		        List<Schema.FieldSetMember> fieldSetMembersSchema = fieldSetRight.getFields();
		        for (Schema.FieldSetMember fieldSetMember : fieldSetMembersSchema) {
		            fieldsFromFieldSets.add(fieldSetMember.fieldPath);
		        }
	        }
    	}
    }
    
    public static Set<String> trimSet(Set<String> fieldValues) {
    	Set<String> result = new Set<String>();
    	for (String value : fieldValues) {
    		result.add(value.trim());
    	}
    	return result;
    }
    
    private static void setFieldSettings(List<Field_Settings__mdt> fieldSettings, sObject currentSobject) {
    	
		for (Field_Settings__mdt fieldSetting : fieldSettings) {
			
			String currentFieldValue = String.valueOf(currentSobject.get(fieldSetting.Field_API_Name__c));
			Set<String> fieldValues = trimSet(new Set<String>(fieldSetting.Field_Values__c.split('\r\n')));
			settings.fieldsWithRefreshAction.add(fieldSetting.Field_API_Name__c);
			
			if (fieldValues.contains(currentFieldValue)) {
				system.debug('fieldSetting.Field_API_Name__c ' + fieldSetting.Field_API_Name__c);
				system.debug('ffieldSetting.Required_Fields__c ' + fieldSetting.Required_Fields__c);
    			if (fieldSetting.ReadOnly_Fields__c != null) {
    				putFieldsIntoMap(fieldSetting.ReadOnly_Fields__c, FieldSetMember.FieldAttribute.READONLY);
    			}
    			if (fieldSetting.Required_Fields__c != null) {
    				putFieldsIntoMap(fieldSetting.Required_Fields__c, FieldSetMember.FieldAttribute.REQUIRED);
    			}
			}
		}
    }
    
    private static void setSharingSettings() {
    	
		for (String fieldApiName : fieldsFromFieldSets) {
			
			Schema.sObjectField currentField = settings.fieldDescribeMap.get(fieldApiName);
			
			if (currentField != null) {
				
				Schema.DescribeFieldResult fieldDescribe = currentField.getDescribe();
				
				Boolean visible = fieldDescribe.isAccessible();
				Boolean editable = fieldDescribe.isUpdateable();
				Boolean isDependentPicklist = fieldDescribe.isDependentPicklist();
				Boolean isHtmlFormatted = fieldDescribe.isHtmlFormatted();
				
				if (!visible) {
					settings.fieldName_FieldType.put(fieldApiName, FieldSetMember.FieldAttribute.NOT_VISIBLE);
				} else if (!editable) {
					settings.fieldName_FieldType.put(fieldApiName, FieldSetMember.FieldAttribute.READONLY);
				}
				if (isHtmlFormatted) {
					settings.htmlFormattedFields.add(fieldApiName);
				}
			}
		}
    }
    
    private static void setDependentPicklistSettings() {
    	
    	for (String fieldApiName : fieldsFromFieldSets) {
			Schema.sObjectField currentField = settings.fieldDescribeMap.get(fieldApiName);
			if (currentField != null) {
				Schema.DescribeFieldResult fieldDescribe = currentField.getDescribe();
				Boolean isDependentPicklist = fieldDescribe.isDependentPicklist();
				if (isDependentPicklist) {
					settings.dependentPicklists.add(fieldApiName);
				}
			}
		}
		
		system.debug('settings.dependentPicklists ' + settings.dependentPicklists);
		
		if (settings.dependentPicklists.size() > 0) {
			List<Dependency_Settings__mdt> dependencySettings = [
				SELECT Controlled_Field_API_Name__c, Dependent_Field_API_Name__c
				FROM Dependency_Settings__mdt
				WHERE Object_API_Name__c = :settings.objectApiName
        		AND Record_Type_Name__c = :settings.recordTypeName
        		AND Dependent_Field_API_Name__c IN :settings.dependentPicklists
			];
			
			system.debug('dependencySettings ' + dependencySettings);
			
			if (dependencySettings.size() > 0) {
				for (Dependency_Settings__mdt dependencySetting : dependencySettings) {
					Schema.sObjectField currentField = settings.fieldDescribeMap.get(dependencySetting.Controlled_Field_API_Name__c);
					if (currentField != null) {
						settings.controlledPicklists.add(dependencySetting.Controlled_Field_API_Name__c);
						settings.childParentPicklistMap.put(dependencySetting.Dependent_Field_API_Name__c, dependencySetting.Controlled_Field_API_Name__c);
					}
				}
			}
		}
		
		system.debug('settings.childParentPicklistMap ' + settings.childParentPicklistMap);
		
		for (String child : settings.childParentPicklistMap.keySet()) {
			 Map<String, List<String>> mapping = getDependentOptions(settings.childParentPicklistMap.get(child), child);
			 if (mapping != null && mapping.size() > 0) {
			 	settings.picklistDependencyMap.put(child, mapping);
			 }
		}
		
		system.debug('settings.picklistDependencyMap ' + settings.picklistDependencyMap);
    }
    
    private static void putFieldsIntoMap(String fieldsString, FieldSetMember.FieldAttribute attr) {
    	if (fieldsString != null) {
			Set<String> fieldSet = trimSet(new Set<String>(fieldsString.split('\r\n')));
			for (String field : fieldSet) {
				settings.fieldName_FieldType.put(field, attr);
			}
		}
    }
    //source http://titancronus.com/blog/2014/05/01/salesforce-acquiring-dependent-picklists-in-apex/
    public static Map<String,List<String>> getDependentOptions(String pControllingFieldName, String pDependentFieldName){
        Map<String,List<String>> objResults = new Map<String,List<String>>();
        //verify field names
        if (!settings.fieldDescribeMap.containsKey(pControllingFieldName) || !settings.fieldDescribeMap.containsKey(pDependentFieldName))
            return objResults;     
        //get the control values   
        List<Schema.PicklistEntry> ctrl_ple = settings.fieldDescribeMap.get(pControllingFieldName).getDescribe().getPicklistValues();
        //get the dependent values
        List<Schema.PicklistEntry> dep_ple = settings.fieldDescribeMap.get(pDependentFieldName).getDescribe().getPicklistValues();
        //iterate through the values and get the ones valid for the controlling field name
        Bitset objBitSet = new Bitset();
        //set up the results
        for(Integer pControllingIndex=0; pControllingIndex<ctrl_ple.size(); pControllingIndex++){        	
            //get the pointer to the entry
            Schema.PicklistEntry ctrl_entry = ctrl_ple[pControllingIndex];
            //get the label
            String pControllingLabel = ctrl_entry.getLabel();
            //create the entry with the label
            objResults.put(pControllingLabel,new List<String>());
        }
        //cater for null and empty
         objResults.put('',new List<String>());
         objResults.put(null,new List<String>());
        //check the dependent values
        for(Integer pDependentIndex=0; pDependentIndex<dep_ple.size(); pDependentIndex++){        	
            //get the pointer to the dependent index
           	Schema.PicklistEntry dep_entry = dep_ple[pDependentIndex];
           	//get the valid for
            String pEntryStructure = JSON.serialize(dep_entry);                
            TPicklistEntry objDepPLE = (TPicklistEntry)JSON.deserialize(pEntryStructure, TPicklistEntry.class);
            //if valid for is empty, skip
            if (objDepPLE.validFor==null || objDepPLE.validFor==''){
                continue;
            }
            //iterate through the controlling values
            for(Integer pControllingIndex=0; pControllingIndex<ctrl_ple.size(); pControllingIndex++){    
            	if (objBitSet.testBit(objDepPLE.validFor,pControllingIndex)){            		
		            //get the label
		            String pControllingLabel = ctrl_ple[pControllingIndex].getLabel();
                    objResults.get(pControllingLabel).add(objDepPLE.label);
                }
            }
        } 
        return objResults;
    }
    
    public class Wrapper {
    	
    	@AuraEnabled
    	public List<LightningSection> sections {get;set;}
    	
    	@AuraEnabled
    	public sObject currentObject {get;set;}
    	
    	@AuraEnabled
    	public String objectApiName {get;set;}
    	
    	@AuraEnabled
    	public Map<String, String> fiedValuesNotDisplayed {get;set;}
    	
    	public Wrapper(List<LightningSection> sections, sObject currentObject, String objectApiName, Map<String, String> fiedValuesNotDisplayed) {
    		this.currentObject = currentObject;
    		this.sections = sections;
    		this.objectApiName = objectApiName;
    		this.fiedValuesNotDisplayed = fiedValuesNotDisplayed;
    	}
    	    	
    }
    
    public class Settings {
    	public Schema.DescribeSObjectResult sObjectDescribe;
		public Map<String, FieldSetMember.FieldAttribute> fieldName_FieldType;
    	public Map<String, Restricted_Picklist__mdt> fieldName_PicklistValues;
    	public String objectApiName;
    	public Set<String> fieldsWithRefreshAction;
    	public Set<String> dependentPicklists;
    	public Set<String> controlledPicklists;
    	public Map<String, Schema.sObjectField> fieldDescribeMap;
    	public String recordTypeName;
    	public Map<String, String> childParentPicklistMap;
    	public Map<String, String> fiedValuesNotDisplayed;
    	public Map<String, Map<String,List<String>>> picklistDependencyMap;
    	public sObject currentSobjectRecord;
    	public Set<String> htmlFormattedFields;
    	
    	public Settings() {
    		this.fieldName_FieldType = new Map<String, FieldSetMember.FieldAttribute>();
    		this.fieldName_PicklistValues = new Map<String, Restricted_Picklist__mdt>();
    		this.fieldsWithRefreshAction = new Set<String>();
    		this.dependentPicklists = new Set<String>();
    		this.controlledPicklists = new Set<String>();
    		this.htmlFormattedFields = new Set<String>();
    		this.picklistDependencyMap = new Map<String, Map<String,List<String>>>();
    		this.childParentPicklistMap = new Map<String, String>();
    		this.fiedValuesNotDisplayed = new Map<String, String>();
    	}
    }
}