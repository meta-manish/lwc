@isTest
private class DeleteClassTriggerTests {
    @isTest static void testDeleteClassTrigger(){
        Class__c testClass = new Class__c(Name='test');
        insert testClass;
        List<Student__c> femaleStudentList = new List<Student__c>();
        femaleStudentList.add(new Student__c(Name='Ankita Garhwal', Last_Name__c = 'Garhwal', Sex__c = 'Female',
            Class__c = testClass.Id));
        femaleStudentList.add(new Student__c(Name='Monika Saini', Last_Name__c = 'Saini', Sex__c = 'Female',
            Class__c = testClass.Id));
        insert femaleStudentList;
        
        Test.startTest();
            Database.DeleteResult result = Database.delete(testClass.Id, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assertEquals('Cannot Delete Class With more than 2 female students',result.getErrors()[0].getMessage());
    }
}