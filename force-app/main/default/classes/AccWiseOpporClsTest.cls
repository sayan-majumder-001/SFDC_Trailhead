@isTest
public class AccWiseOpporClsTest {
    @isTest
    public static void TestMethod1(){
        Account acc = new Account(Name='TestAccount');
        insert acc;
        AccWiseOpporCls obj = new AccWiseOpporCls();
        obj.displayOpportunity();
        obj.getAcctItems();
    }
}