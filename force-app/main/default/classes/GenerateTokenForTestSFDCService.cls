public with sharing class GenerateTokenForTestSFDCService implements Queueable, Database.AllowsCallouts{
    public void execute(QueueableContext context) {
        //your code including the callout
       String soql = 'select Id,endpoint__c,username__c,password__c,client_id__c,client_secret__c,generated_token__c from Token_Information__mdt where masterlabel = \'Test Service\'';
       List<Token_Information__mdt> lstMdt = Database.query(soql);
       String endPoint = lstMdt[0].endpoint__c +'?grant_type=password'+ '&client_id='+lstMdt[0].client_id__c +'&client_secret='+ lstMdt[0].client_secret__c +'&username='+ lstMdt[0].username__c+'&password='+ lstMdt[0].password__c;
        Http h = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        HttpResponse response = h.send(request);
        Map<String, object> mapResponse = new Map<String, object>();
        mapResponse = (Map<String, object>)JSON.deserializeUntyped(response.getBody());
        Map<String, Object> updateCMMap = new Map<String, Object>();
        updateCMMap.put('generated_token__c',(String)mapResponse.get('access_token'));
        CreateUpdateMetadataUtils.createUpdateMetadata('Token_Information.Test_Service','Test Service',updateCMMap);
    }
}
