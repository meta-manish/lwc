public class manageClassExtension {
    private final Class__c pageClass;
    ApexPages.StandardSetController controller;
    public Id classId {get; set;}
    public Boolean showEditForm {get; set;}
    public Class__c classDetails {get; set;}
    public String state {get; set;}

   
    public manageClassExtension(ApexPages.StandardSetController stdController) {
        controller = stdController;
        pageClass = (Class__c) stdController.getRecord();
        showEditForm = false;
   	}
    
    public void editClass(){
        classId = System.currentPagereference().getParameters().get('classId');
        classDetails = [SELECT Id, Name, Teacher__c, Detailed_Description__c, Board__c, Fee__c, MaxSize__c, My_Count__c, Custom_Status__c FROM Class__c WHERE Id = :classId];
        showEditForm = true;
    }
    
    public void deleteClass(){
        classId = System.currentPagereference().getParameters().get('classId');
        classDetails = [SELECT Id, Name, Teacher__c, Detailed_Description__c, Board__c, Fee__c, MaxSize__c, My_Count__c, Custom_Status__c FROM Class__c WHERE Id = :classId];
        Delete classDetails;
    }
    
    public PageReference saveChanges(){
        update classDetails;
        showEditForm = false;
        return null;
    }
    
    public void cancelEdit(){
        showEditForm = false;
    }
}