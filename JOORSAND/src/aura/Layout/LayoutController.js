({
	doInit: function(component, event, helper) {
		helper.getSections(component);
    },
    
    cancel: function(component) {
		var navEvt = $A.get("e.force:navigateToSObject");
	    navEvt.setParams({
	    	"recordId": component.get("v.recordId"),
	    	"slideDevName": "related"
	    });
	    navEvt.fire();
    },
    
    save: function(component, event, helper) {
    	helper.save(component);
    },
    
    refresh: function(component, event, helper) {
    	helper.refresh(component);
    }
})