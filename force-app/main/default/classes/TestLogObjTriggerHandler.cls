public with sharing class TestLogObjTriggerHandler {
    public static void updateAccountLatestLogTime(List<TestLogObject__c> testLogObjList) {
        set<Id> setAccId = new Set<Id>();
        List<Account> lstAccUpd = new List<Account>();
        List<TestLogObject__c> lstTestLogUpd = new List<TestLogObject__c>();
      for(TestLogObject__c tstObj : testLogObjList){
          if(tstObj.Account__c  != null){
        setAccId.add(tstObj.Account__c);
          }
      }
      List<Account> lstAcc = [select Id, Latest_Log_Time__c from Account where Id IN :setAccId];
      for(Account acc : lstAcc){
        Account newAcc= new Account();
        newAcc.Id = acc.Id;
        newAcc.Latest_Log_Time__c = System.now();
        lstAccUpd.add(newAcc);
      }
      try{
          if(!lstAccUpd.isEmpty()){
              update lstAccUpd;
          }
          for(TestLogObject__c tstObj : testLogObjList){
            TestLogObject__c newTestLogObj = new TestLogObject__c();
            newTestLogObj.Id = tstObj.Id;
            newTestLogObj.TriggerCallEnded__c = System.now();
            lstTestLogUpd.add(newTestLogObj);
        }
        if(!lstTestLogUpd.isEmpty()){
            update lstTestLogUpd;
        }
      }catch(Exception ex){
          system.debug('Exception occured:::'+ex.getStackTraceString());
      }
    }
}