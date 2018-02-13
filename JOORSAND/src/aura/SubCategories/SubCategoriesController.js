({
	doInit : function(component, event, helper) {
		var categoryAPIName = helper.getCategoryAPIName();
		component.set("v.CategotyAPIName", categoryAPIName);
		var action = component.get("c.getSubCategories");
		action.setParams({ categoryName : categoryAPIName});
		
		action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //alert("From server: " + response.getReturnValue());
                var subCategories = response.getReturnValue();
                cobsole.log(subCategories);
                cobsole.log(subCategories[0]);
            } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
	}
})