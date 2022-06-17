public class opportunityLookupExtension {
    public Opportunity opp;
    ApexPages.StandardController controller;
    public list <Contact> contacts {get;set;}
    Contact selectedCon;
    
    public opportunityLookupExtension(ApexPages.StandardController con) {
        controller = con;
        this.opp = (Opportunity) con.getRecord();
        if(opp.Manager__c != null){
            contacts = [SELECT Title, Name, Phone FROM Contact WHERE AccountId = :opp.Manager__c];
        }
    }
    
    private PageReference back() {
        PageReference cancel = controller.cancel();
        return cancel;
    }
    
    public PageReference SaveBillToContact() {
        String selcontactid = System.currentPagereference().getParameters().get('radioName');
        System.debug(System.currentPagereference().getParameters().get('radioName'));
        if(selcontactid != null) {
            Contact selectedCon = [Select Id,FirstName,LastName,Email,Phone from Contact where Id=:selcontactid];
            opp.BillToContact__c = selectedCon.Id;
            Update opp;
        }
        return this.back();
    }
    
    public PageReference ClearBillToContact() {
        opp.BillToContact__c = null;
        Update opp;
        return this.back();
    }
}