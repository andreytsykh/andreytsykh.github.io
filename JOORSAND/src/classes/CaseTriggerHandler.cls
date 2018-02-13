public class CaseTriggerHandler {

    public static void checkAssignments(List<Case> cases) {
        system.debug('');
        try {
            for (Case currentCase : cases) {
                system.debug('currentCase.OwnerId ' + currentCase.OwnerId);
                system.debug('Label.Case_Assignment_Group_User_ID ' + Label.Case_Assignment_Group_User_ID);
                system.debug('currentCase.Subject ' + currentCase.Subject);
                system.debug('Label.Case_Assignment_Subject ' + Label.Case_Assignment_Subject);
                system.debug(currentCase.OwnerId == Label.Case_Assignment_Group_User_ID);
                system.debug(currentCase.Subject == Label.Case_Assignment_Subject);
                if (currentCase.OwnerId == Label.Case_Assignment_Group_User_ID && currentCase.Subject == Label.Case_Assignment_Subject) {
                    currentCase.OwnerId = label.Case_Assignment_User_ID;

                }
            }
        } catch (Exception e) {
            system.debug('Error: ' + e.getMessage());
        }
    }

    public static void onBeforeInsert(List<Case> cases, Round_robin__c robin) {
        CaseService.assigningUsers(cases, robin);
    }

    public static void assingingContactsAndAccounts(List<Case> cases) {
        CaseService.assingingContactsAndAccounts(cases);
    }
}