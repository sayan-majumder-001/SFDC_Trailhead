@istest
public class AccWisrConClsTest {
    @istest
    public static void testMethodNew(){
        Account con=new Account(Name='NewAccount');
        insert con;
        AccWiseConCls obj= new AccWiseConCls();
        obj.getAccItems();
        obj.selectAccount();
        obj.editContactDetails();
        obj.CloseEditPanel();
        
    }
      @istest
    public static void testMethodNew1(){
        AccWiseConCls obj= new AccWiseConCls();
        obj.getAccItems();
        obj.selectAccount();
        obj.CloseEditPanel();
        
    }
}