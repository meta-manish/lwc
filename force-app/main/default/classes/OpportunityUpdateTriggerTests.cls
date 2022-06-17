@isTest
private class OpportunityUpdateTriggerTests {
    @isTest static void testOpportunityUpdate() {
        Opportunity opportunity = new Opportunity(Name = 'Zomato IPO', StageName = 'Prospecting',
            CloseDate = Date.newInstance(2022,6,21));
        insert opportunity;
        opportunity.StageName = 'Closed Won';
        
        Test.startTest();
            Database.update(opportunity, false);
        Test.stopTest();
        
        Date expectedDate = System.today();
        System.assertEquals(expectedDate, [SELECT CloseDate From Opportunity Where Id = :opportunity.Id].CloseDate);
    }
}