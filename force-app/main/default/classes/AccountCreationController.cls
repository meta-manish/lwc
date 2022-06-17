public with sharing class AccountCreationController {
    public AccountCreationController() {

    }
    @AuraEnabled
    public static Account createAccount(Account accountRecord){
        try {
            insert accountRecord;
            return accountRecord;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}