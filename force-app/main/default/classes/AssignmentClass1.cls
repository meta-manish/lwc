public class AssignmentClass1 {
    public static List<String> namesOfStudents(Id classId){
        Student__c[] namesOfStudents = [SELECT Name From Student__c WHERE Class__r.Id = :classId];
        //System.debug(namesOfStudents);
        List<String> namesList = new List<String>();
        for(Student__c student: namesOfStudents){
            namesList.add(student.Name);
        }
        return namesList;
    }
    
    public static Map<String, Set<Id>> mapOfClass() {
        List<Class__c> classes = [SELECT Name, (SELECT Id FROM Students__r) FROM Class__c];
        Map<String, Set<Id>> mapOfClasses = new Map<String, Set<Id>>();
        for(Class__c eachClass:classes) {
            Set<Id> idSet = new Set<Id>();
            for(Student__c student : eachClass.Students__r){
                idSet.add(student.id);
            }
            mapOfClasses.put(eachClass.Name,idSet);
        }
        return mapOfClasses;
    }
    
    public static Integer numberOfWorkingDays(Date startDate, Date endingDate){
        Date startingDate = startDate;
        Integer numberOfWorkingDays = 0;
        while(startingDate <= endingDate){
            Datetime dt = datetime.newInstance(startingDate.year(),startingDate.month(),startingDate.day());
            if(dt.format('E') != 'Sat' && dt.format('E')!= 'Sun'){
                numberOfWorkingDays += 1;
            }
            startingDate = startingDate.addDays(1);
        }
        return numberOfWorkingDays;
    }
}