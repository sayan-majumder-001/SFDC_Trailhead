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
    @Future(callout=true)
    public static void doCallout(Set<Id> ids) {
      List<TestLogObject__c> lstTest = [select account__c from TestLogObject__c where Id in :ids ];
      List<Account> lstAcc = [select Id,doCallout__c from Account where Id = :lstTest[0].account__c];
      system.debug('lstAcc:::'+lstAcc);
     if(!lstAcc[0].doCallout__c){
      system.debug('inside');
       //CALLOUT 1 - Agify
        String endpoint ='https://api.agify.io?name=Sayan';
        HTTP h = new HTTP();
        HTTPRequest req = new HTTPRequest();
        req.setEndPoint(endpoint);
        req.setMethod('GET');
        HTTPResponse res = h.send(req);
        Map<String, Object> mapAgePredict = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        //CALLOUT 2
        String endpoint1 ='https://api.genderize.io?name='+(String)mapAgePredict.get('name');
        HTTP h1 = new HTTP();
        HTTPRequest req1 = new HTTPRequest();
        req1.setEndPoint(endpoint1);
        req1.setMethod('GET');
        HTTPResponse res1 = h1.send(req1);
        Map<String, Object> mapAgePredict1 = (Map<String, Object>) JSON.deserializeUntyped(res1.getBody());
        //CALLOUT 3
        String endpoint2 ='https://api.nationalize.io?name='+(String)mapAgePredict1.get('name');
        HTTP h2 = new HTTP();
        HTTPRequest req2 = new HTTPRequest();
        req2.setEndPoint(endpoint2);
        req2.setMethod('GET');
        HTTPResponse res2 = h2.send(req2);
        Map<String, Object> mapAgePredict2 = (Map<String, Object>) JSON.deserializeUntyped(res2.getBody());
        List<Id> idList=new List<Id>();
        idList.addAll(ids);
        TestLogObject__c updatedObj = new TestLogObject__c();
        system.debug('Id Val:::'+idList[0]);
        updatedObj.Id = idList[0];
        updatedObj.testName__c = (String)mapAgePredict2.get('name');
        update updatedObj;
 }
}
}