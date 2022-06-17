@isTest
private class StudentLimitTriggerTests {
    @isTest static void testStudentLimitTrigger() {
        Class__c testClass = new Class__c(Name='test', MaxSize__c = 1);
        insert testClass;
        Student__c student = new Student__c(Name='Ankita Garhwal', Last_Name__c = 'Garhwal', Sex__c = 'Female',
            Class__c = testClass.Id);
        insert student;
        Student__c student2 = new Student__c(Name='Monika Saini', Last_Name__c = 'Saini', Sex__c = 'Female',
            Class__c = testClass.Id);
        
        Test.startTest();
            Database.SaveResult result = Database.insert(student2, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assertEquals('Class Full', result.getErrors()[0].getMessage());
    }
}