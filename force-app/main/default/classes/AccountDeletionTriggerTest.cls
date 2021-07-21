@isTest
private class AccountDeletionTriggerTest {
    static testMethod void myTest() {
       
          Account acc = new Account(name='Test Account');
          insert acc;
     
        try
			{
				Delete acc;
			}
			catch(Exception ee)
			{
                Boolean expectedExceptionThrown =  ee.getMessage().contains('Script-thrown exception') ? true : false;
				System.assertEquals(expectedExceptionThrown, true);
                
            }
        
    }
}