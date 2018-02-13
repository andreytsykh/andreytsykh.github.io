/**
 * Created by Valera on 23.01.2018.
 */

@IsTest
private class ScheduleTest {

    public static CronTrigger selectorCronTrigger(String ids) {
        return [
                SELECT Id, CronExpression, TimesTriggered,
                        NextFireTime
                FROM CronTrigger
                WHERE id = :ids
        ];
    }

    static testMethod void testScheduleRoundRobin() {
        Test.startTest();


        String CRON_EXP_WEEK_PM = '0 0 21 ? * SAT *';
        String CRON_EXP_WEEK_AM = '0 0 9 ? * MON *';
        String CRON_EXP_PM = '0 0 21 ? * * *';
        String CRON_EXP_AM = '0 0 9 ? * * *';

        Round_robin__c robin = new Round_robin__c(Name = 'testSchedule', day_week__c = true, time_day__c = true);
        insert robin;
        System.debug('--->>>> ' + Round_Robin__c.getInstance('testSchedule'));


        String weekPM = System.schedule('jobWeekPM', CRON_EXP_WEEK_PM, new ScheduleWeekPM());
        String weekAM = System.schedule('jobWeekAM', CRON_EXP_WEEK_AM, new ScheduleWeekAM());
        String dayAM = System.schedule('jobDayAM', CRON_EXP_AM, new ScheduleDayAM());
        String dayPM = System.schedule('jobDayPM', CRON_EXP_PM, new ScheduleDayPM());

        CronTrigger ct = selectorCronTrigger(weekPM);
        System.assertEquals(CRON_EXP_WEEK_PM, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);

        ct = selectorCronTrigger(weekAM);
        System.assertEquals(CRON_EXP_WEEK_AM, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);

        ct = selectorCronTrigger(dayAM);
        System.assertEquals(CRON_EXP_AM, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);

        ct = selectorCronTrigger(dayPM);
        System.assertEquals(CRON_EXP_PM, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);


        Test.stopTest();


    }
}