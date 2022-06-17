public class AccountRelatedContacts {
    @future
    public static void connectContacts(Id contactId){
        Contact contact = [SELECT Id, AccountId, Account.ContactIDs__c FROM Contact WHERE ID = :contactId];
        List<Contact> relatedContact = [SELECT Id FROM Contact WHERE AccountId = :contact.AccountId];
        List<Id> idList = new List<Id>();
        for(Contact con: relatedContact){
            idList.add(con.Id);
        }
        if(contact.Account.ContactIDs__c == null){
            Account account = new Account();
            account.Id = contact.AccountId;
            String listOfContacts = idList.toString();
            account.ContactIDs__c = listOfContacts.substring(1,listOfContacts.length()-1);
            update account;
        }else{
            String contactIds = contact.Account.ContactIDs__c;
            if(!contactIDs.contains(contactId)){
                contactIds = contactIds + ', ' + contactId;
                Account account = new Account();
                account.Id = contact.AccountId;
                account.ContactIDs__c = contactIds;
                update account;
            }
        }
    }
}