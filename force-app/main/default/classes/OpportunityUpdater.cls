public class OpportunityUpdater implements Queueable{
    private List<Opportunity> opportunitiesList;
    public OpportunityUpdater(List<Opportunity> opportunities){
        this.opportunitiesList = opportunities;
    }
    public void execute(QueueableContext context){
        List<Contact> contactList = [SELECT Id, AccountId FROM Contact];
        for(Opportunity opportunity : opportunitiesList){
            if(opportunity.BillToContact__c != null && opportunity.Manager__c == null){
                for(Contact contact: contactList){
                    if(opportunity.BillToContact__c == contact.Id){
                        opportunity.Manager__c = contact.AccountId;
                    }
                }
            }
        }
        update opportunitiesList;
    }
}