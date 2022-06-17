public class Assignment1Class2 {
    public static List<String> ListOfSObjects(){
        List<String> listOfSObjects = new List<String>();
        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
            listOfSObjects.add(objTyp.getDescribe().getName());
        }
        return listOfSObjects;
    }
}