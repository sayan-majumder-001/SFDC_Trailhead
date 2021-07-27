public with sharing class CallTestServiceImpl {
    @AuraEnabled(cacheable = true)
    public static List<TestLogObject__c> callTestServiceMethod(String AccountId) {
        //Make sure your Salesforce instance URL is added in remote site settings
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
    }
}