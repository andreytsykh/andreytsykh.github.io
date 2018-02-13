/**
 * Created by Valera on 23.01.2018.
 */

@IsTest
private class CaseTriggerTest {

     /**
    Round Robin test logic
     */
    public static String ID_CROUP { get; set; }
    public static List<User> users { get; set; }
    public static List<Group> groups { get; set; }
    public static String devName { get; set; }
    public static Set<Id> idUsers { get; set; }

    public static void initDataBase() {
        List<GroupMember> members = [
                SELECT UserOrGroupId, GroupId
                FROM GroupMember
                WHERE GroupId IN (
                        SELECT Id
                        FROM Group
                        WHERE Type = :Label.Type_Queue
                )
                ORDER BY UserOrGroupId
        ];
        ID_CROUP = null;
        groups = [SELECT id, DeveloperName FROM Group WHERE id = :members.get(0).GroupId ORDER BY Id];
        Set<Id> idUsers = new Set<Id>();
        for (GroupMember member : members) {
            if (member.GroupId == groups.get(0).Id) {
                ID_CROUP = groups.get(0).Id;
                idUsers.add(member.UserOrGroupId);
            }
        }
        users = [SELECT Id, Name FROM User WHERE Id IN:idUsers];
        List<Round_robin__c> robins = new List<Round_robin__c>();
        if (!users.isEmpty()) {
            for (Integer i = 0; i < groups.size(); i++) {
                devName = groups.get(i).DeveloperName;
                robins.add(new Round_robin__c(Name = groups.get(i).DeveloperName, night_users__c = users.get(0).Id, list_Queue__c = groups.get(i).DeveloperName));
            }
        }
        insert robins;
    }


    public static void createCases(Integer sizeList) {
        List<Case> cases = new List<Case>();
        for (Integer i = 0; i < sizeList; i++) {
            cases.add(new Case(Reason = 'Other', Status = 'New', Type = 'CSM', Origin = 'Cgat', Minutes_Spent__c = 3, OwnerId = ID_CROUP));
        }
        insert cases;
    }
    static testMethod void testDayWeekFalse() {
        initDataBase();
        Test.startTest();
        createCases(3);
        Test.stopTest();
    }

    static testMethod void testDayWeekTrue() {
        initDataBase();
        Round_robin__c robin = CustomSettingManager.getRoundRobin(devName);
        System.debug(robin);
        robin.day_week__c = true;
        upsert robin;
        Test.startTest();
        createCases(10);
        Test.stopTest();
    }

    static testMethod void testTimeAndDayTrue() {
        initDataBase();
        Round_robin__c robin = CustomSettingManager.getRoundRobin(devName);
        System.debug(robin);
        robin.day_week__c = true;
        robin.time_day__c = true;
        upsert robin;

        Test.startTest();
        createCases(11);
        Test.stopTest();
    }

    /**
    Assingning  Contact and Account to new Case if it exist
     */

    public static void initDataAssingContactAndAccount() {
        Id idRecordAcc = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Brand - Prospect').getRecordTypeId();
        System.debug('Record Type' + idRecordAcc);
        Account testAcc = new Account(RecordTypeId = idRecordAcc, Name = 'Test Name', Business_Category__c = 'Brand', Type = 'Other', BillingCity = 'Test',
                BillingCountry = 'Cuba',
                BillingStreet = 'TestStreet',
                BillingPostalCode = 't3stcd3',
                ShippingCity = 'Test',
                ShippingCountry = 'Cuba',
                ShippingStreet = 'TestStreet',
                ShippingPostalCode = 't3stcd3');
        insert testAcc;
        Contact testContact = new Contact(LastName = 'TestLastName', AccountId = testAcc.Id, Title = 'TestTitle', Email = 'testAddress@gmail.com');
        insert testContact;
        Account oneAcc = new Account(RecordTypeId = idRecordAcc, Name = 'JOOR Retail Web Users', Business_Category__c = 'Brand', Type = 'Other', BillingCity = 'Test',
                BillingCountry = 'Cuba',
                BillingStreet = 'TestStreet',
                BillingPostalCode = 't3stcd3',
                ShippingCity = 'Test',
                ShippingCountry = 'Cuba',
                ShippingStreet = 'TestStreet',
                ShippingPostalCode = 't3stcd3');
        insert oneAcc;
        Contact oneContact = new Contact(LastName = 'JOOR Web User', AccountId = oneAcc.Id, Title = 'TestTitle', Email = 'Retail@jooraccess.com');
        insert oneContact;

    }

    public static Case getNewCase(String email) {
        Id idRecordCase = Schema.SObjectType.Case.getRecordTypeInfosByName().get('CSM').getRecordTypeId();
        System.debug('Record Type' + idRecordCase);
        return new Case(Reason = 'Other'
        , RecordTypeId = idRecordCase
        , Status = 'New'
        , Type = 'CSM', Origin = 'Chat'
        , Minutes_Spent__c = 3
        , AccountId = null
        , ContactId = null
        , SuppliedEmail = email);
    }

    public static Case getNewCaseOrrigen(String email) {
        Id idRecordCase = Schema.SObjectType.Case.getRecordTypeInfosByName().get('CSM').getRecordTypeId();
        System.debug('Record Type' + idRecordCase);
        return new Case(Reason = 'Other'
        , RecordTypeId = idRecordCase
        , Status = 'New'
        , Type = 'CSM'
        , Minutes_Spent__c = 3
        , AccountId = null
        , ContactId = null
        , SuppliedEmail = email
        , Origin = 'Retail@jooraccess.com');
    }

    public static Contact selectorContact() {
        return [
                SELECT Id
                        , AccountId
                        , Name
                FROM Contact
                WHERE Name = 'TestLastName'
                LIMIT 1
        ];
    }

    public static void mainPartTesting(Case testCase, String result_1, String result_2) {
        insert testCase;
        testCase = [SELECT Id, AccountId, ContactId, SuppliedEmail FROM Case LIMIT 1];
        System.assertEquals(testCase.AccountId, result_1);
        System.assertEquals(testCase.ContactId, result_2);
    }

    static testMethod void testAssingningAcAndCont() {
        initDataAssingContactAndAccount();
        Case testCase = getNewCase('testAddress@gmail.com');
        Contact cnt = selectorContact();
        System.debug('CONTACT : ' + cnt);
        Test.startTest();
        mainPartTesting(testCase, cnt.AccountId, cnt.Id);
        Test.stopTest();
    }

    static testMethod void testAssingningAccNull() {
        initDataAssingContactAndAccount();
        Case testCase = getNewCase('testAddress@gmail.com');
        Contact cnt = selectorContact();
        cnt.AccountId = null;
        upsert cnt;
        cnt = selectorContact();
        Test.startTest();
        mainPartTesting(testCase, null, cnt.Id);
        Test.stopTest();
    }

    static testMethod void testAssingningContactNull() {
        initDataAssingContactAndAccount();
        Case testCase = getNewCase('testAddress@gmail.com');
        Contact cnt = selectorContact();
        delete cnt;
        Test.startTest();
        mainPartTesting(testCase, null, null);
        Test.stopTest();
    }

    static testMethod void testAssingningCaseNullEmail() {
        initDataAssingContactAndAccount();
        Case testCase = getNewCase(null);
        Test.startTest();
        mainPartTesting(testCase, null, null);
        Test.stopTest();
    }

    static testMethod void testOrigenWithEmail() {
        initDataAssingContactAndAccount();
        Case testCase = getNewCaseOrrigen('testAddress@gmail.com');
        Contact oneContact = [
                SELECT id
                        , Name
                FROM Contact
                WHERE Name = 'JOOR Web User'
                LIMIT 1
        ];
        Account oneAccount = [
                SELECT id
                        , Name
                FROM Account
                WHERE name = 'JOOR Retail Web Users'
                LIMIT 1
        ];

        Test.startTest();
        mainPartTesting(testCase, oneAccount.Id, oneContact.Id);
        Test.stopTest();
    }
}