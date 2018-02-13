public class FieldSetMember {
	
	public enum FieldAttribute {REQUIRED, READONLY, NOT_VISIBLE}
	private Schema.DescribeSObjectResult sObjectDescribe;
    private static Set<String> picklistTypes = new Set<String>{'combobox', 'multipicklist', 'picklist'};
    private static Map<String, String> objectName_FieldName_Map = new Map<String, String>{'Case' => 'CaseNumber'};

    @AuraEnabled
    public Boolean DBRequired {get;set;}

    @AuraEnabled
    public String fieldPath {get;set;}

    @AuraEnabled
    public String label {get;set;}

    @AuraEnabled
    public Boolean required {get;set;}

    @AuraEnabled
    public Boolean visible {get;set;}

    @AuraEnabled
    public Boolean readonly {get;set;}

    @AuraEnabled
    public Boolean action {get;set;}
    
    @AuraEnabled
    public Boolean isHtmlFormatted {get;set;}

    @AuraEnabled
    public String type {get; set;}

    @AuraEnabled
    public String parentObjectName {get; set;}

    @AuraEnabled
    public String displayedFieldName {get; set;}
    
    @AuraEnabled
    public List<SelectOptionWrapper> picklistValues {get; set;}
	

    public FieldSetMember(Schema.FieldSetMember fieldSetMember, LayoutController.Settings settings) {
        this.readonly = false;
        this.visible = true;
        this.action = false;
        this.isHtmlFormatted = false;
    	this.sObjectDescribe = settings.sObjectDescribe;
        this.fieldPath = fieldSetMember.fieldPath;
        this.label = fieldSetMember.label;
        this.required = fieldSetMember.DBRequired;
        this.type = String.valueOf(fieldSetMember.getType()).toLowerCase();
        
        this.setFieldAttributes(settings.fieldName_FieldType);
        this.picklistValues = this.getPicklistValues(settings);
        this.setOnchangeAction(settings);
        this.setLookupInfo(settings.fieldDescribeMap);
        this.setFormulaInfo(settings.htmlFormattedFields);
    }
    
    private List<SelectOptionWrapper> getPicklistValues(LayoutController.Settings settings) {
    	if (picklistTypes.contains(this.type)) {
    		List<SelectOptionWrapper> result = new List<SelectOptionWrapper>{new SelectOptionWrapper('--None--', '')};
    		Map<String, List<String>> mapping = settings.picklistDependencyMap.get(this.fieldPath);
    		if (mapping != null) {
    			String parentFiledName = settings.childParentPicklistMap.get(this.fieldPath);
    			if (parentFiledName != null) {
    				
    				String parentFiledValue;
    				
    				if (settings.fiedValuesNotDisplayed.containsKey(parentFiledName)) {
    					parentFiledValue = settings.fiedValuesNotDisplayed.get(parentFiledName);
    				} else {
    					parentFiledValue = String.valueOf(settings.currentSobjectRecord.get(parentFiledName));
    				}
    				
    				List<String> selectValues = mapping.get(parentFiledValue);
    				if (selectValues != null && selectValues.size() > 0) {
    					for (String selectValue : selectValues) {
    						result.add(new SelectOptionWrapper(selectValue, selectValue));
    					}
    				}
    			}
    		} else {
	    		Set<String> picklistValuesFromMap = getPicklistValuesFromSettings(settings.fieldName_PicklistValues);
	    		//system.debug('picklistValuesFromMap ' + picklistValuesFromMap);
	    		List<Schema.PicklistEntry> options = this.sObjectDescribe.fields.getMap().get(this.fieldPath).getDescribe().getPicklistValues();
	    		if (options != null && options.size() > 0) {
	    			for (Schema.PicklistEntry option : options) {
	    				if (picklistValuesFromMap != null) {
	    					//system.debug('option.getValue() ' + option.getValue());
	    					//system.debug('option.getLabel() ' + option.getLabel());
	    					if (picklistValuesFromMap.contains(option.getValue())) {
	    						result.add(new SelectOptionWrapper(option.getLabel(), option.getValue()));
	    					}
	    				} else {
							result.add(new SelectOptionWrapper(option.getLabel(), option.getValue()));
	    				}
					}
	    		}
    		}
    		
    		if (result.size() == 1) {
    			this.required = false;
    		}
    		return result;
    	}
    	return null;
    }
    
    private Set<String> getPicklistValuesFromSettings(Map<String, Restricted_Picklist__mdt> fieldName_PicklistValues) {
    	Restricted_Picklist__mdt settings = fieldName_PicklistValues.get(this.fieldPath);
    	if (settings != null) {
    		//system.debug('settings ' + settings);
    		Set<String> fieldSet = LayoutController.trimSet(new Set<String>(settings.Picklist_values__c.split('\r\n')));
    		if (fieldSet.size() > 0) {
    			//system.debug('fieldSet ' + fieldSet);
    			return fieldSet;
    		}
    	}
    	return null;
    }
    
    private void setFieldAttributes(Map<String, FieldSetMember.FieldAttribute> fieldName_FieldType) {
    	FieldAttribute fieldType = fieldName_FieldType.get(this.fieldPath);
    	if (fieldType != null) {
    		if (fieldType == FieldAttribute.NOT_VISIBLE) {
    			visible = false;
    		} else if (fieldType == FieldAttribute.REQUIRED) {
	    		this.required = true;
	    		this.readonly = false;
	    	} else if (fieldType == FieldAttribute.READONLY) {
	    		this.readonly = true;
	    	}
	    }
    }
    
    private void setOnchangeAction(LayoutController.Settings settings) {
    	if (settings.fieldsWithRefreshAction.contains(this.fieldPath) || settings.controlledPicklists.contains(this.fieldPath)) {
    		this.action = true;
    	}
    }
    
    private void setLookupInfo(Map<String, Schema.sObjectField> fieldDescribeMap) {
    	if (this.type == 'reference') {
    		Schema.sObjectField field = fieldDescribeMap.get(this.fieldPath);
    		if (field != null) {
    			try {
	    			Schema.DescribeFieldResult fieldDescribe = field.getDescribe();
	    			Schema.sObjectType parentObject = fieldDescribe.getReferenceTo()[0];
	    			Schema.DescribeSObjectResult parentObjectDescribe = parentObject.getDescribe();
	    			this.parentObjectName = parentObjectDescribe.getName();
	    			this.displayedFieldName = getNameField(parentObjectName);
    			} catch(Exception e) {
    				system.debug('setLookupInfo error ' + e.getMessage());
    			}
    		}
    	}
    }
    
    private void setFormulaInfo(Set<String> htmlFormattedFields) {
    	if (htmlFormattedFields.contains(this.fieldPath)) {
    		this.isHtmlFormatted = true;
    	}
    }
    
    private String getNameField(String parentObjectName) {
    	String result = objectName_FieldName_Map.get(parentObjectName);
    	return result != null ? result : 'Name';
    }
    
    public class SelectOptionWrapper {
    	
    	@AuraEnabled
    	public String label {get; set;}
    	
    	@AuraEnabled
    	public String value {get; set;}
    	
    	public SelectOptionWrapper(String label, String value) {
    		this.label = label;
    		this.value = value;
    	}
    }
}