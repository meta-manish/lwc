trigger ClassStatusTrigger on Class__c (before update, after update) {
    
    if(Trigger.isBefore){
        for(Class__c clas : Trigger.New){
            if(clas.Custom_Status__c == 'Reset' && Trigger.OldMap.get(clas.Id).Custom_Status__c != 'Reset'){
                clas.My_Count__c = 0;
            }
        }
    }
    if(Trigger.isAfter){
        List<Id> idList = new List<Id>();
        for(Class__c clas : Trigger.New){
            if(clas.Custom_Status__c == 'Reset' && Trigger.OldMap.get(clas.Id).Custom_Status__c != 'Reset'){
                idList.add(clas.id);
            }
        }
        List<Student__c> deleteStudentList = [SELECT Id From Student__c WHERE Class__c IN :idList];
        delete deleteStudentList;
    }
}