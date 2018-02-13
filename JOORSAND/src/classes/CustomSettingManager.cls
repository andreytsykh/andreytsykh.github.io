/**
 * Created by Valera on 22.01.2018.
 */

public with sharing class CustomSettingManager {

    public static List<Round_Robin__c> getAllRobin() {
        List<Round_Robin__c> robins = [
                SELECT id
                        , Name
                        , time_day__c
                        , day_week__c
                        , last_user__c
                        , list_Queue__c
                        , night_users__c
                        , start_time__c
                        , end_time__c
                FROM Round_Robin__c

        ];
        if (!robins.isEmpty()) {
            return robins;
        } else
                return null;
    }

    public static Round_Robin__c getRoundRobin(String name) {
        return Round_Robin__c.getInstance(name);
    }

    public static void scheduleTimeOfDay(Boolean flag) {
        List<Round_robin__c> robins = getAllRobin();
        List<Round_robin__c> newRobins = new List<Round_robin__c>();
        for (Round_robin__c robin : robins) {
            robin.time_day__c = flag;
            newRobins.add(robin);
        }
        upsert newRobins;
    }

    public static void scheduleDayOfWeek(Boolean flag) {
        List<Round_robin__c> robins = getAllRobin();
        List<Round_robin__c> newRobins = new List<Round_robin__c>();
        for (Round_robin__c robin : robins) {
            robin.day_week__c = flag;
            newRobins.add(robin);
        }
        upsert newRobins;
    }
}