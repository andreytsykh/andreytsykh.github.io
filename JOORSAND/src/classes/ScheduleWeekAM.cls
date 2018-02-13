/**
 * Created by Valera on 23.01.2018.
 */

global with sharing class ScheduleWeekAM implements Schedulable {
    global void execute(SchedulableContext SC) {
        CustomSettingManager.scheduleDayOfWeek(true);

    }
}