/**
 * Created by Valera on 30.01.2018.
 */

@IsTest
private class RoundRobinUpdateTest {

    public static void addTestRoundRobin() {
        Round_robin__c robin = new Round_robin__c(Name = 'TestRobin'
        , day_week__c = true
        , end_time__c = System.now().addMinutes(30)
        , is_active__c = true
        , start_time__c = System.now().addMinutes(-30)
        , time_day__c = true);
        insert robin;
        robin = new Round_robin__c(Name = 'Test2'
        , day_week__c = true
        , is_active__c = true
        , start_time__c = System.now().addMinutes(-30)
        , time_day__c = true);
        insert robin;
        System.debug(robin);
    }

    static testMethod void setTrueFlagDay() {
        addTestRoundRobin();
        Test.StartTest();
        ID batchprocessid = Database.executeBatch(new RoundRobinUpdate());
        Test.StopTest();
    }

    static testMethod void setFalseFlagDay() {
        addTestRoundRobin();
        Round_robin__c test = Round_robin__c.getInstance('TestRobin');
        test.end_time__c = System.now().addMinutes(-10);
        upsert test;
        System.Test.StartTest();
        ID batchprocessid = Database.executeBatch(new RoundRobinUpdate());
        System.Test.StopTest();
    }
}