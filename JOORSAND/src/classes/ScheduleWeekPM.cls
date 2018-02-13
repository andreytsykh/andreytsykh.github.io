/**
 * Created by Valera on 23.01.2018.
 */

global with sharing class ScheduleWeekPM implements Schedulable {
    global void execute(SchedulableContext SC) {
        CustomSettingManager.scheduleDayOfWeek(false);
    }
}