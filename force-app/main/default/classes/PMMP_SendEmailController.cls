public without sharing class PMMP_SendEmailController {
    
@AuraEnabled
public static List<PMMP_Material_Request__c> updateCount(string recordId) {
    
   try {
   List<PMMP_Material_Request__c> matReqList = new List<PMMP_Material_Request__c>();
   for(PMMP_Material_Request__c objMaterialRequest : [SELECT id, PMMP_Count__c from PMMP_Material_Request__c where id = :recordId LIMIT 1]) {
       if(objMaterialRequest.PMMP_Count__c == Null) {
       objMaterialRequest.PMMP_Count__c = 0 ;
       }
       objMaterialRequest.PMMP_Count__c = objMaterialRequest.PMMP_Count__c + 1 ;
       matReqList.add(objMaterialRequest);
   }
   
   Database.Update(matReqList);
  return matReqList;
   }
   
   catch(exception ex) {
       return new list<PMMP_Material_Request__c>();
   }
   
   }
}