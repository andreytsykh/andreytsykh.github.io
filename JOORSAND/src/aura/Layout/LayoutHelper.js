({
    getSections: function(component) {
        var action = component.get("c.getSections");
        action.setParams({recordId: component.get("v.recordId")});
        action.setCallback(this, function(a) {
            var wrapper = a.getReturnValue();
            if (wrapper) {
	            component.set("v.sections", wrapper.sections);
	            console.log("wrapper.sections");
	            console.log(wrapper.sections);
	            console.log("wrapper.fiedValuesNotDisplayed");
	            console.log(wrapper.fiedValuesNotDisplayed);
	            component.set("v.hiddenFieldsHolder", wrapper.fiedValuesNotDisplayed);
	            
	            component.set("v.currentObject", wrapper.currentObject);
	            component.set("v.objectApiName", wrapper.objectApiName);
	            component.set("v.hasLayouts", true);
	            
	            console.log('***');
	            console.log(component.get("v.hiddenFieldsHolder"));
            }
        });
        $A.enqueueAction(action);
    },
    
    
    refresh: function(component) {
    	var action = component.get("c.refreshSobject");
    	var sObject = this.getSobjectFromThePage(component);
    	component.set("v.hasLayouts", false);
        action.setParams({incomeSobject: sObject});
        action.setCallback(this, function(a) {
            var wrapper = a.getReturnValue();
            if (wrapper) {
	            component.set("v.sections", wrapper.sections);
	            console.log("wrapper.sections");
	            console.log(wrapper.sections);
	            component.set("v.currentObject", wrapper.currentObject);
	            component.set("v.objectApiName", wrapper.objectApiName);
	            component.set("v.hasLayouts", true);
            }
        });
        $A.enqueueAction(action);
    },
    
    save: function(component) {
    
    	var spinner = component.find("spinner");
        $A.util.removeClass(spinner, "slds-hide");
        
    	var self = this;
    	
    	var sObject = this.getSobjectFromThePage(component);
    	
    	if (self.valid(sObject, component)) {
    	
	    	console.log("sObject");
	    	console.log(sObject);
	    	
	    	var action = component.get("c.updateSobject");
	        action.setParams({currentSobject: sObject});
	        action.setCallback(this, function(a) {
	        	$A.util.addClass(spinner, "slds-hide");
	            var message = a.getReturnValue();
	            var state = a.getState();
	            var error = a.getError();
	            console.log('state ' + state);
	            if (error && error.length > 0) {
	            	self.showToast("error", "Error!", "Wrong field value.");
	            } else if (message == "success") {
		            self.showToast("success", "Success!", "The record has been updated successfully.");
	            } else {
	            	self.showToast("error", "Error!", message);
	            }
	        });
	        $A.enqueueAction(action);
        } else {
        	$A.util.addClass(spinner, "slds-hide");
        }
    },
    
    valid: function(sObject, component) {
    	var requiredFields = component.get("v.requiredFields");
    	var self = this;
    	if (requiredFields) {
    		for (var i = 0; i < requiredFields.length; i++) {
    			var value = sObject[requiredFields[i].fieldPath];
    			if (!value) {
    				self.showToast("error", "Error!", "Required Field: " + requiredFields[i].label);
    				return false;
    			}
    		}
    	}
    	return true;
    },
    
    showToast : function(type, title, message) {
	    var toastEvent = $A.get("e.force:showToast");
	    toastEvent.setParams({
	        "title": title,
	        "message": message,
	        "type": type
	    });
	    toastEvent.fire();
	},
    
    getSobjectFromThePage: function(component) {
    	
    	var map = component.get("v.hiddenFieldsHolder");
    	var sections = component.get("v.sections");
    	var sectionsFromLayout = component.find("section");
    	
    	if (!Array.isArray(sections)) {
    		sections = [sections];
    	}
    	if (!Array.isArray(sectionsFromLayout)) {
    		sectionsFromLayout = [sectionsFromLayout];
    	}
    	
    	var result = {
			Id: component.get("v.recordId"),
			sobjectType: component.get("v.objectApiName")
		};
		
    	var self = this;
    	var requiredFields = [];
    	
    	for (var i = 0; i < sections.length; i++) {
    		var fieldApiNames = self.getFieldsApiNames(sections[i].leftFields).concat(self.getFieldsApiNames(sections[i].rightFields));
    		result = Object.assign(result, self.getSectionPartialObject(fieldApiNames, sectionsFromLayout[i]));
    		requiredFields = requiredFields.concat(self.getRequiredFields(sections[i].leftFields)).concat(self.getRequiredFields(sections[i].rightFields));
    	}
    	
    	component.set("v.requiredFields", requiredFields);
    	result = Object.assign(result, map);
    	
    	return result;
    },
    
    getRequiredFields: function(fieldSetMembers) {
    	var result = [];
    	if (fieldSetMembers) {
    		for (var i = 0; i < fieldSetMembers.length; i++) {
    			if (fieldSetMembers[i].required) {
    				result.push(fieldSetMembers[i]);
    			}
    		}
    	}
    	return result;
    },
    
    getFieldsApiNames: function(fieldSetMembers) {
    	var result = [];
    	if (fieldSetMembers) {
    		for (var i = 0; i < fieldSetMembers.length; i++) {
    			result.push(fieldSetMembers[i].fieldPath);
    		}
    	}
    	return result;
    },
    
    getSectionPartialObject: function(fieldApiNames, currentSectionComponent) {
    	var result = {};
    	if (fieldApiNames && currentSectionComponent) {
    		for (var i = 0; i < fieldApiNames.length; i++) {
    			var fiedlApiName = fieldApiNames[i];
    			var fieldFromComponentLayout = currentSectionComponent.find(fiedlApiName);
    			if (fieldFromComponentLayout) {
    				if (fieldFromComponentLayout.get("v.isLookup")) {
    					result[fiedlApiName] = fieldFromComponentLayout.get("v.selectedValue");
    				} else {
    					result[fiedlApiName] = fieldFromComponentLayout.get("v.value");
					}
    			}
    		}
    	}
    	return result;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
})