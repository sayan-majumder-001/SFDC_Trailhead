@RestResource(urlMapping='/TestResource/v1/*')
global with sharing class TestService
{
 
    @HttpGet
    global static String createRecord(){
        DateTime startDT = system.now();
        boolean isExecute = false;
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        Id testObjId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        TestLogObject__c test = new TestLogObject__c (ServiceCalledStarted__c = startDT, account__c = testObjId);
        insert test;
        TestLogObject__c test1 = new TestLogObject__c();
        test1.Id = test.Id;
        test1.ServiceCallEnded__c=system.now();
        update test1;
        return 'Logdata is created with Id:'+test.Id;
   }
}