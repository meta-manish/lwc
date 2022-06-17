public with sharing class ContactController {
    public String contactId{get;set;}
    public Contact contactObj{get;set;}

    public ContactController(){
        contactObj = new Contact();
    }

    @AuraEnabled
    public static String insertContact(Contact contact){
        insert contact;
        return contact.id;
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        return [
            SELECT FirstName, LastName, Email
            FROM Contact
            WITH SECURITY_ENFORCED
            ORDER BY FirstName
            LIMIT 10
        ];
    }

    public pageReference retrieveContactDetail(){
        if(contactId!=null){
            contactObj = [SELECT Id, FirstName, Email FROM Contact WHERE ID=:contactId];
        }
        return null;
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [
            SELECT Name, Email
            FROM Contact
            WHERE Name LIKE :key
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }
}