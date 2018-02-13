({
    afterRender : function(component, helper) {
        this.superAfterRender();
        //setTimeout(function(){console.log(document.getElementsByClassName("test-id__section")[0]);}, 5000);
        var body = document.querySelector("body");
        body.addEventListener("dblclick", function(event){console.log('dblclick');});
    }
	// Your renderer method overrides go here
	// var approverInput = document.querySelector(".approver input");
})