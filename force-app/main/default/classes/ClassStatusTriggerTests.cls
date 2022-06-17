@isTest
public class ClassStatusTriggerTests {
    @isTest static void testClassStatusTrigger() {
        Class__c testClass = new Class__c(Name = 'Demo Class', Custom_Status__c = 'New');
        insert testClass;
        Student__c student = new Student__c(Name='Ankita Garhwal', Last_Name__c = 'Garhwal', Sex__c = 'Female',
            Class__c = testClass.Id);
        insert student;
        testClass.Custom_Status__c = 'Reset';
        
        Test.startTest();
            Database.update(testClass, false);
        Test.stopTest();
        
        System.assertEquals(0,[SELECT Id, Name From Student__c Where Class__r.Id = :testClass.Id].size());
    }
}