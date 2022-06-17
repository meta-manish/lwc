trigger DeleteClassTrigger on Class__c (before delete) {
    List<Class__c> classList = [SELECT Id, (SELECT Id FROM Students__r 
                                WHERE Sex__c = 'Female') FROM Class__c WHERE ID IN :Trigger.Old];
    for(Class__c eachClass : classList){
        if(eachClass.Students__r.size() > 1){
            Trigger.oldMap.get(eachClass.id).addError('Cannot Delete Class With more than 2 female students');
        }
    }
}