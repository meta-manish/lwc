public with sharing class ContactCreationController {
    public ContactCreationController() {

    }
    @AuraEnabled
    public static Contact createContact(Contact contactRec){
        try {
            insert contactRec;
            return contactRec;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}