trigger updateMyCountTrigger on Student__c (after insert, after update) {
    List<Id> classId = new List<Id>();
    for(Student__c student : Trigger.New){
        classId.add(student.Class__c);
    }
    List<Class__c> classList = [SELECT ID, My_Count__c, (SELECT Id FROM Students__r) FROM Class__c WHERE Id IN :classId];
    for(Class__c eachClass : classList){
        eachClass.My_Count__c = eachClass.Students__r.size();
    }
    update classList;
    if(Trigger.isUpdate){
        List<Id> classId = new List<Id>();
        for(Student__c student : Trigger.Old){
            classId.add(student.Class__c);
        }
        List<Class__c> classList = [SELECT ID, My_Count__c, (SELECT Id FROM Students__r) FROM Class__c WHERE Id IN :classId];
        for(Class__c eachClass : classList){
            eachClass.My_Count__c = eachClass.Students__r.size();
        }
        update classList;
    }
}