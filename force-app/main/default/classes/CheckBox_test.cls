@isTest
public class CheckBox_test {
    @isTest
  public static void TestMethod1(){
        Checkbox_Class obj = new Checkbox_Class();
        Account acc = new Account(Name='Test');
        insert acc;
        obj.getAccounts();
        obj.accountList[0].selected = true;
        obj.getSelected();
        obj.GetSelectedAccounts();
    }
    @isTest
     public static void TestMethod2(){
        Checkbox_Class obj = new Checkbox_Class();
        Account acc = new Account(Name='Test');
        insert acc;
        obj.getAccounts();
        obj.accountList[0].selected = false;
        obj.getSelected();
        obj.GetSelectedAccounts();
    }
}