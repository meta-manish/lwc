public class JSONFormat {
    public String JSONString{get;set;}
    
    public JSONFormat(){
        List<Student__c> student = [SELECT Name, Class__c, DOB__c, Sex__c, Age__c FROM Student__c];
        JSONString = JSON.serialize(student);
    }
}