public class OpportunityMailer implements Schedulable {
    public void execute(SchedulableContext slc) {
        List<Opportunity> opportunityList = [SELECT Owner.Email FROM Opportunity WHERE LastModifiedDate < LAST_N_DAYS:30];
        List<String> emailList = New List<String>();
        for(opportunity op: opportunityList){
            emailList.add(op.Owner.Email);
        }
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(emailList);
        mail.setSubject('Opportunity Not Modified In Last 30 Days');
        mail.setPlainTextBody('Please Modify Opportunity');
        Messaging.sendEmail(new Messaging.Email[]{ mail });
    }
}