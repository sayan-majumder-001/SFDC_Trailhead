public with sharing class CallTestServiceImpl {
    @AuraEnabled(cacheable=false)
    public static List<TestLogObject__c> callTestServiceMethod(String AccountId) {
        if([select Id,doCallout__c from Account where Id = :AccountId].doCallout__c){
        //Make sure your Salesforce instance URL is added in remote site settings
        //introduce delay 3 callouts start
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
         //introduce delay 3 callouts end
        List<TestLogObject__c> lstFinal = new List<TestLogObject__c>();
        String sfdcURL = URL.getSalesforceBaseUrl().toExternalForm();
        String soql = 'select Id,generated_token__c from Token_Information__mdt where masterlabel = \'Test Service\'';
        List<Token_Information__mdt> lstMdt = Database.query(soql);
        String restAPIURL = sfdcURL + '/services/apexrest/TestResource/v1/' + AccountId;
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setMethod('GET');
        httpRequest.setHeader('Authorization', 'Bearer ' + lstMdt[0].generated_token__c);
        httpRequest.setEndpoint(restAPIURL);
        String response = '';
        try {
            Http http = new Http();
            HttpResponse httpResponse = http.send(httpRequest);
            if (httpResponse.getStatusCode() == 200) {
                response = JSON.serializePretty(JSON.deserializeUntyped(httpResponse.getBody()));
                String debugId = response.split(':')[1].removeEnd('"');
                lstFinal =
                   [SELECT Account__c,Id,Name,OwnerId,ServiceCalledStarted__c,ServiceCallEnded__c,TriggerCallEnded__c,workflowEnded__c FROM TestLogObject__c where Account__c != null and Id = :debugId];
            } else {
                lstFinal = null;
                System.debug(' httpResponse ' + httpResponse.getBody());
                throw new CalloutException(httpResponse.getBody());
            }
        } catch (System.Exception e) {
            lstFinal = null;
            System.debug('ERROR: ' + e);
            throw e;
        }
        return lstFinal;
    }else{
        TestLogObject__c test = new TestLogObject__c (ServiceCalledStarted__c = System.now(), account__c = AccountId, status__c = 'Open');
        insert test;
         return null;
    }
 }
}