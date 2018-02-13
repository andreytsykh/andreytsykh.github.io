({
	doInit : function(cmp, event, helper) {
		$A.createComponent("force:recordView",
                           {recordId: '0060x000003ZvaZAAS', type: "FULL"},
                           function(component) {
                               cmp.set("v.body", [component]);
                               console.log('doInit');
        					   console.log(document.querySelector(".test-id__section"));
                           });
	},
    
    doneRendering :function() {
        console.log('doneRendering');
        console.log(document.querySelector(".test-id__section"));
        setTimeout(function(){console.log(document.querySelector(".test-id__section"));}, 500);
    }
})