({
	openTemplate : function(cmp, event, helper) {
        var action = cmp.get("c.getInfo");
        action.setParams({caseId : cmp.get("v.recordId")});
        
        var contactId;
        var url;
        var currentEmail = $A.get("$SObjectType.CurrentUser.Email");
       action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {           
                contactId = response.getReturnValue()[0];
                url = response.getReturnValue()[1];
                console.log(response.getReturnValue()[0]);
                //console.log(response.getReturnValue().ContactId);
                //console.log(response.getReturnValue().Id);
                console.log(cmp.get("v.recordId"));
              // window.location = '/_ui/core/email/author/EmailAuthor?p3_lkid ='+cmp.get("v.recordId")+'&p3='+caseNum+'&rtype=003&template_id=00X0x000000QGwa';
               window.location = url+'/email/author/emailauthor.jsp?retURL=/'+cmp.get("v.recordId")+'&p3_lkid='+cmp.get("v.recordId")+'&rtype=003&p2_lkid='+contactId+'&template_id=00X0x000000QGwa&p26='+currentEmail+'&new_template=true';
                
                
            }
           
          	else if (state === "ERROR") {
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