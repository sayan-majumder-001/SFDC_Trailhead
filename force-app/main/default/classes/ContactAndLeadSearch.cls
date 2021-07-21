public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads( String str){    
     List<List<SObject>> searchList = [FIND :str  RETURNING Contact(FirstName, LastName), Lead(FirstName , LastName)];
        return searchList;
    }
}