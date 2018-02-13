/**
 * Created by new on 03.01.2018.
 */
({ closeCase: function (component) {
    var action = component.get("c.caseClosing");
    action.setParams({"caseId": component.get("v.recordId")});
    $A.enqueueAction(action);
}
})