public class LightningSection {
	
	@AuraEnabled
    public List<FieldSetMember> leftFields;
    
    @AuraEnabled
    public List<FieldSetMember> rightFields;
    
    @AuraEnabled
    public String title;
    
    public LightningSection(String title, List<FieldSetMember> leftFields, List<FieldSetMember> rightFields) {
    	this.title = title;
    	this.leftFields = leftFields;
    	this.rightFields = rightFields;
    }
}