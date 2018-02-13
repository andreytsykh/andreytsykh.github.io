@isTest(SeeAllData=true)
public class CaseTriggerHandlerTest {

    public static void initBase() {
        List<User> users = [SELECT id, Name FROM User LIMIT 5];
        System.debug('Users' + users);
        Group grp = new Group(Name = 'Test', DeveloperName = 'Integrations');
        insert grp;
//        List<GroupMember> groupMembers = new List<GroupMember>();
//        for (Integer i = 0; i < 3; i++) {
//            groupMembers.add(new GroupMember(UserOrGroupId = users.get(i).Id, GroupId = grp.Id));
//        }
//        upsert groupMembers;
    }

    private static testmethod void test() {
        initBase();
        List<User> users = [SELECT id, Name FROM User LIMIT 5];
        List<Group> grp = [SELECT Id FROM Group LIMIT 1];
        Id idRecordCase = Schema.SObjectType.Case.getRecordTypeInfosByName().get('CSM').getRecordTypeId();
        System.debug('GRP' + grp);
        System.debug('###' + idRecordCase);
        Case caseObj = new Case(
                RecordTypeId = idRecordCase,
                Subject = 'Customer Sync',
                OwnerId = users.get(0).Id,
//                OwnerId = grp.get(0).Id,
                Origin = 'integrations@jooraccess.com',
                Minutes_Spent__c = 1
        );

        insert caseObj;
        update caseObj;
    }
}