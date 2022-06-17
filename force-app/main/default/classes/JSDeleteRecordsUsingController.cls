public with sharing class JSDeleteRecordsUsingController {
    @RemoteAction
    public static void deleteStudents(String selectedIds){
        List<id> selectedStudentIds = selectedIds.split(',');        
        List<Student__C> allSelectedStudents = [select id, name from Student__c where id in: selectedStudentIds];
        delete allSelectedStudents;
    }
}