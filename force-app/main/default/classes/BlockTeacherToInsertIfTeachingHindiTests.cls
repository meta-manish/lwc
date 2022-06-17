@isTest
private class BlockTeacherToInsertIfTeachingHindiTests {
    @isTest static void testBlockTeacherIfTeachingHindi() {
        Contact teacher = new Contact(FirstName = 'A K', LastName = 'Mishra', Sex__c = 'Male');
        insert teacher;
        Class__c eighthclass = new Class__c(Name= 'Eighth Class');
        insert eighthClass;
        Teach__c teaches = new Teach__c(Name = 'Eighth Hindi', Class__c = eighthClass.Id, Teacher__c = teacher.Id, 
            Subject__c = 'Hindi');
        
        Test.startTest();
            Database.SaveResult result = Database.insert(teaches, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assertEquals('Cannot Create/Edit if Teaching Hindi.', result.getErrors()[0].getMessage());
    }
}