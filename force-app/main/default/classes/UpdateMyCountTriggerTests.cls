@isTest
private class UpdateMyCountTriggerTests {
    @isTest static void testUpdateMyCountTriggerOnInsert() {
        Class__c testClass = new Class__c(Name='test', My_Count__c = 0);
        insert testClass;
        Student__c student = new Student__c(Name='Ankita Garhwal', Last_Name__c = 'Garhwal', Sex__c = 'Female',
            Class__c = testClass.Id);
        
        Test.startTest();
            Database.insert(student, false);
        Test.stopTest();
        
        System.assertEquals(1,[SELECT My_Count__c FROM Class__c].My_Count__c);
    }
    @isTest static void testUpdateMyCountTriggerOnUpdate() {
        List<Class__c> classList = new List<Class__C>();
        classList.add(new Class__c(Name='test', My_Count__c = 0));
        classList.add(new Class__c(Name='test1', My_Count__c = 0));
        insert classList;
        Student__c student = new Student__c(Name='Ankita Garhwal', Last_Name__c = 'Garhwal', Sex__c = 'Female',
            Class__c = classList[0].Id);
        insert student;
        student.Class__c = classList[1].Id;
        
        Test.startTest();
            Database.update(student, false);
        Test.stopTest();
        
        System.assertEquals(0,[SELECT My_Count__c FROM Class__c WHERE Id = :classList[0].Id].My_Count__c);
        System.assertEquals(1,[SELECT My_Count__c FROM Class__c WHERE Id = :classList[1].Id].My_Count__c);
    }
}