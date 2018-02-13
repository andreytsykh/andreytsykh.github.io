({
	buildFields : function(component) {
		var section = component.get("v.section");		
		var leftComponents = this.createComponents(section.leftFields, component);
		var rightComponents = this.createComponents(section.rightFields, component);
		
		$A.createComponents(
            leftComponents,
            function(comp, status, errorMessage){
                if (status === "SUCCESS") {
                    component.set("v.leftPanel", comp);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.");
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                }
            }
        );
		
		$A.createComponents(
            rightComponents,
            function(comp, status, errorMessage){
                if (status === "SUCCESS") {
                    component.set("v.rightPanel", comp);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.");
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                }
            }
        );
	},
	
	configMap: {
        "anytype": "ui:inputText",
        "base64": "ui:inputText",
        "boolean": "ui:inputCheckbox",
        "combobox": "ui:inputSelect",
        "currency": "ui:inputText",
        "datacategorygroupreference": "ui:inputText",
        "date": "ui:inputDate",
        "datetime": "ui:inputDateTime",
        "double": "ui:inputNumber",
        "email": "ui:inputEmail",
        "encryptedstring": "ui:inputText",
        "id": "ui:inputText",
        "integer": "ui:inputNumber",
        "multipicklist": "ui:inputSelect",
        "percent": "ui:inputNumber",
        "picklist": "ui:inputSelect",
        "reference": "ui:inputText",
        "string": "ui:inputText",
        "textarea": "ui:inputTextArea",
        "time": "ui:inputDateTime",
        "url": "ui:inputText"
    },
    
    createLookup: function(field, currentObject, component) {
    	var item = [
			"c:LightningLookup",
			{
				"sObjectName": field.parentObjectName,
				"displayedFieldName": field.displayedFieldName,
				"valueFieldName": "Id",
				"label": field.label,
				"showHelp": "true",
				"required": field.required,
				"disabled": field.disabled,
				"aura:id" : field.fieldPath,
				"selectedValue": currentObject[field.fieldPath]
			}
		];
		return item;
    },
    
    createComponents: function(fields, component) {
    
    	var result = [];
    	var self = this;
    	var currentObject = component.get("v.currentObject");
    	
    	for (var i = 0; i < fields.length; i++) {
    		var field = fields[i];
    		console.log(field);
    		var item;
    		if (field.visible) {
    			if (field.type == "reference") {
    				item = self.createLookup(field, currentObject, component);
    			} else if (field.isHtmlFormatted) {
    				item = [
		    			"c:LightningFormula",
		    			{
		    				"label": field.label,
		    				"value": currentObject[field.fieldPath],
		    				"aura:id" : field.fieldPath
						}
		    		];
    			} else {
	    			var fieldType = self.configMap[field.type];
	    			item = [
		    			fieldType,
		    			{
		    				"label": field.label,
		    				"required": field.required,
		    				"value": currentObject[field.fieldPath],
		    				"aura:id" : field.fieldPath
						}
		    		];
		    		if (fieldType == 'ui:inputSelect') {
		    			item[1].options = field.picklistValues;
		    		} else if (fieldType == 'ui:inputDate') {
		    			item[1].displayDatePicker = true;
		    		}
		    		if (field.readonly) {
		    			item[1].disabled = "disabled";
		    		}
		    		if (field.action) {
		    			item[1].change = component.getReference("v.refresh");
		    		}
		    		if (field.type == "multipicklist") {
		    			item[1].multiple = true;
		    		}
	    		}
	    		
    		}
    		if (item) {
    			result.push(item);
			}
    	}
    	
    	return result;
    }
})