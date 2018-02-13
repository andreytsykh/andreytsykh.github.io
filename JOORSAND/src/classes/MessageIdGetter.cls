/**
 * Created by new on 13.02.2018.
 */

global class MessageIdGetter implements Messaging.InboundEmailHandler{


    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,
            Messaging.InboundEnvelope envelope){

        System.debug('=============================Inbound Handler============================');
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        return result;



    }

    public  EmailMessage getEmail(){
        List<Case> cases = [SELECT Id,CaseThreadId__c,
        (SELECT Id,Subject, FromAddress,ActivityId,MessageIdentifier,Headers,TextBody FROM Emails),
        (SELECT Id,Subject,FromAddress,TextBody FROM EmailMessages) FROM Case WHERE Subject = 'SUBJECT TEST'];
        List<EmailMessage> emails = cases[0].Emails;
        return emails[0];
    }

}