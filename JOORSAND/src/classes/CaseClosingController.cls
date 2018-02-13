/**
 * Created by new on 03.01.2018.
 */

public  class CaseClosingController {

    @AuraEnabled
    public static void caseClosing(Id caseId){
        Case closedCase = new Case(Id = caseId, Status ='Closed');
        upsert closedCase;

    }
}