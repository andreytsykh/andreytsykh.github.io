/**
 * Created by Valera on 30.01.2018.
 */

global with sharing class RoundRobinUpdate implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT id' +
                ', Name, time_day__c' +
                ', day_week__c' +
                ', last_user__c' +
                ', is_active__c' +
                ', list_Queue__c' +
                ', night_users__c' +
                ', start_time__c' +
                ', end_time__c ' +
                'FROM Round_Robin__c';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Round_robin__c> robins) {
        Long startTime = 0;
        Long endTime = 0;
        Long currenttime = System.now().getTime();
        for (Round_robin__c robin : robins) {
            if (robin.start_time__c == null | robin.end_time__c == null)
                continue;
            startTime = robin.start_time__c.getTime();
            endTime = robin.end_time__c.getTime();
            if (currenttime >= startTime && currenttime < endTime && robin.is_active__c) {
                robin.time_day__c = true;
            } else {
                robin.time_day__c = false;
            }
            if (currenttime >= endTime) {
                Datetime str = robin.start_time__c;
                Datetime endT = robin.end_time__c;
                str = str.addDays(1);
                endT = endT.addDays(1);
                robin.start_time__c = str;
                robin.end_time__c = endT;
            }
        }
        upsert robins;
    }
    global void finish(Database.BatchableContext BC) {
    }
}