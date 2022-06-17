trigger BlockTeacherToInsertIfTeachingHindi on Teach__c (before insert, before update) {
    for(Teach__c teach : Trigger.New){
        if(teach.Subject__c.contains('Hindi')){
            teach.addError('Cannot Create/Edit if Teaching Hindi.');
        }
    }
}