@isTest
private class AccountRelatedContactsTests {
    @isTest static void testConnectContactsWhenFieldIsEmpty() {
        Account account = new Account(Name='Paytm IPO');
        insert account;
        Contact contact = new Contact(FirstName = 'Aniket', LastName='Kumar',Sex__c='Male', AccountId = account.Id);
        insert contact;
        
        Test.startTest();
            AccountRelatedContacts.connectContacts(contact.Id);
        Test.stopTest();
        
        System.assertEquals(contact.id, [SELECT ContactIDs__c FROM Account WHERE Id = :account.id].ContactIDs__c);
    }
    
    @isTest static void testConnectContactsWhenFieldIsNotEmpty(){
        Account account = new Account(Name='Paytm IPO');
        insert account;
        List<Contact> contacts = new List<Contact>();
        contacts.add(new Contact(FirstName = 'Aniket', LastName='Kumar',Sex__c='Male', AccountId = account.Id));
        contacts.add(new Contact(FirstName = 'Ankit', LastName='Kumar',Sex__c='Male', AccountId = account.Id));
        insert contacts;
        account.ContactIDs__c = contacts[0].id;
        update account;
        
        Test.startTest();
            AccountRelatedContacts.connectContacts(contacts[1].Id);
        Test.stopTest();
        
        System.assertEquals(contacts[0].Id + ', ' + contacts[1].Id, 
            [SELECT ContactIDs__c FROM Account WHERE Id = :account.id].ContactIDs__c);
    }
}