/**
 * Created by Valera on 30.01.2018.
 */

global with sharing class ScheduleRunBatchRR implements Schedulable {
    global void execute(SchedulableContext SC) {
        Database.executeBatch(new RoundRobinUpdate());
    }
}