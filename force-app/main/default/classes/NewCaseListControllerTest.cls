@istest
public class NewCaseListControllerTest {

    @istest
    public static void newCaseListControllerTestMethod(){
        Case cas = new Case(Status ='New', Priority = 'Medium', Origin = 'Email');
		insert cas; 
        NewCaseListController nc=new NewCaseListController();
        nc.getNewCases();
        
    }
}