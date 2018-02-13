public class TemplateService {
    
    @AuraEnabled
    public static List<String> getInfo(Id caseId){
        List<String> infos = new List<String>();
        List<Case> cases = [SELECT CaseNumber,ContactId FROM Case WHERE Id = :caseId];
        if(!cases.isEmpty()){
             infos.add(cases[0].ContactId);
             infos.add(URL.getSalesforceBaseUrl().toExternalForm());
            return infos;
        }
        return null;
    }
}