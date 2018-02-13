trigger CaseTrigger on Case (before update, before insert, after insert, after update ) {

    if (Trigger.isBefore) {
        if (Trigger.isUpdate) {
            CaseTriggerHandler.checkAssignments(Trigger.new);
        } else if (Trigger.isInsert) {
            CaseTriggerHandler.checkAssignments(Trigger.new);
            CaseTriggerHandler.assingingContactsAndAccounts(Trigger.new);
            Round_robin__c robin = CaseService.getRoundRobin(Trigger.new);
            if (robin != null && robin.day_week__c && robin.is_active__c) {
                CaseTriggerHandler.onBeforeInsert(Trigger.new, robin);
            }
        }
    } else if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            System.debug('==================================AFTER TRIGGER===================');
        } else if (Trigger.isUpdate) {
            System.debug('==================================AFTER UPDATE===================');
        }
    }
}