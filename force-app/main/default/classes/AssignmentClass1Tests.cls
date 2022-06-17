@isTest
private class AssignmentClass1Tests {
    @isTest static void namesOfStudentsTest(){
        Class__c newClass = new Class__c(Name='VII');
        insert newClass;
        Student__c student = new Student__c(Name = 'Demo', Last_Name__c = 'data', Class__c = newClass.id);
        insert student;
        List<String> expectedNamesList = new List<String>();
        expectedNamesList.add(student.Name);
                                            
        Test.startTest();
            List<String> namesList = AssignmentClass1.namesOfStudents(newClass.id);
        Test.stopTest();
                                            
        System.assertEquals(expectedNamesList, namesList);
    }
    
    @isTest static void mapOfClassTest() {
        Class__c classes = new Class__c(Name='VII');
        insert classes;
        Student__c student = new Student__c(Name= 'Aniket', Last_Name__c = 'Kumar', Class__C = classes.Id);
        insert student;
        Set<Id> idSet = new Set<Id>();
        idSet.add(student.Id);
        Map<String, Set<Id>> expectedMapResult = new Map<String, Set<Id>>();
        expectedMapResult.put(classes.Name,idSet);
        
        Test.startTest();
            Map<String, Set<Id>> returnedMapResult = AssignmentClass1.mapOfClass();
        Test.stopTest();
        
        System.assertEquals(expectedMapResult, returnedMapResult,'');
    }
    
    @isTest static void numberOfWorkingDaysTest(){
        Date startDate = Date.newInstance(2016, 12, 23);
        Date endDate = Date.newInstance(2017, 1, 25);
        
        Test.startTest();
            Integer actualNumberOfWorkingDays = AssignmentClass1.numberOfWorkingDays(startDate, endDate);
        Test.stopTest();
        
        System.assertEquals(24,actualNumberOfWorkingDays);
    }
}