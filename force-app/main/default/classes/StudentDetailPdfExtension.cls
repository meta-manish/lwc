public class StudentDetailPdfExtension {
    private final Student__c pageStudent;
    ApexPages.StandardController controller;
    
    public StudentDetailPdfExtension(ApexPages.StandardController stdController) {
        controller = stdController;
        this.pageStudent = (Student__c)stdController.getRecord();
    }
    
    private PageReference back() {
        PageReference cancel = controller.cancel();
        return cancel;
    }
    
    public PageReference saveAttachment(){
        List<Attachment> attachments = [SELECT Id FROM Attachment WHERE ParentId = :pageStudent.Id];
        List<Attachment> attachmentsInClass = [SELECT Id FROM Attachment WHERE ParentId = :pageStudent.Class__c AND 
                                               Name = :pageStudent.Name+'.pdf'];
        if(attachments.size() > 0){
            Delete attachments;
        }
        if(attachmentsInClass.size() > 0){
            Delete attachmentsInClass;
        }
        
        PageReference pdf = new PageReference('/apex/StudentDetailsPDF');
        pdf.getParameters().put('id',pageStudent.id);
        Blob body;
        body = pdf.getContentAsPDF();
        
        Attachment att = new Attachment( ParentId=pageStudent.id, Body=body, Name=pageStudent.Name+'.pdf' );
        insert att;
        Attachment attInClass = new Attachment( ParentId=pageStudent.Class__c, Body=body, Name=pageStudent.Name+'.pdf' );
        insert attInClass;
        return this.back();
    }
}