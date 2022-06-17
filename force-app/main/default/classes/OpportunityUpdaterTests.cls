@isTest
private class OpportunityUpdaterTests {
    @testSetup static void setup(){
        Account account = new Account(Name = 'BTU Bikaner');
        insert account;
        Contact contact = new Contact(FirstName = 'Aniket', LastName = 'Kumar', Sex__c = 'Male', AccountId = account.Id);
        insert contact;
        Opportunity opportunity = new Opportunity(Name='Oils & Fields', BillToContact__c=contact.Id,
            CloseDate = Date.newInstance(2022,4,30) ,StageName='Prospecting');
        insert opportunity;
    }
    static testmethod void testOpportunityUpdater(){
        List<Opportunity> opportunityList = [SELECT Id, BillToContact__C, Manager__c FROM Opportunity];
        OpportunityUpdater opportunityupdate = new OpportunityUpdater(opportunityList);
        
        Test.startTest();
            System.enqueueJob(opportunityupdate);
        Test.stopTest();
        
        Id accountId = [SELECT Id FROM Account][0].Id;
        System.assertEquals(accountId,[SELECT Manager__c From Opportunity][0].Manager__c);
    }
}