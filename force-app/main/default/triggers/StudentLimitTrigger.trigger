trigger StudentLimitTrigger on Student__c (before insert) {
    List<Class__c> classList = [SELECT Id, MaxSize__c, (SELECT Id, Name From Students__r) FROM Class__c];
    for(Student__c student : Trigger.New){
        for(Class__c clas : classList){
            if(student.Class__c == clas.id && clas.Students__r.size() == clas.MaxSize__c){
                student.adderror('Class Full');
            }
        }
    }
}