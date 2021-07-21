@istest(SeeAllData=true)
public class CustomLinksConsoleHomeControllerTest {
    
    public static testmethod void method1(){

    CustomLinksConsoleHomeController cls=new CustomLinksConsoleHomeController();

    }
    
      public static testmethod void method2(){
          
       Custom_Links__c cl = new  Custom_Links__c();
       cl.name='facebook';
       insert cl;
    CustomLinksConsoleHomeController cls=new CustomLinksConsoleHomeController();

    }
       

}