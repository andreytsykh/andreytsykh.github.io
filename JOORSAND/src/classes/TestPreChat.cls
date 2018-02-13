/**
 * Created by Valera on 02.02.2018.
 */

public without sharing class TestPreChat {

    public TestPreChat() {
    }

    @AuraEnabled
    public static String getParamsFromForm(String str) {
        System.debug('HELLO FROM CONTROLLER');
        return 'Hi';
    }

    public static void updateIncoming(String testId) {
        LiveChatTranscript tt = [SELECT Id, Browser FROM LiveChatTranscript Where LiveChatVisitorID = :testId LIMIT 1];
        tt.Browser = 'Chrome 63.0.0000.111';
        update tt;
    }

}