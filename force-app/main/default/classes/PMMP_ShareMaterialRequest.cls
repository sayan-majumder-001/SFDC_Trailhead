public class PMMP_ShareMaterialRequest {
   @InvocableMethod
    public static void shareMaterialRequests(List<ID> recordID) {
    
    
       List<PMMP_Material_Request__Share> matReqShare = new List<PMMP_Material_Request__Share>();
        List<PMMP_Material_Request__c> listMaterial = [select id, PMMP_Location_code__c from PMMP_Material_Request__c where id =:recordID];
       
        String locationCode = listMaterial[0].PMMP_Location_code__c + '%' ;
        
        List<Group> groupId = [select id from Group where name like : locationCode ];
        for(PMMP_Material_Request__c matReq : listMaterial) {
             PMMP_Material_Request__Share materialRecord = new PMMP_Material_Request__Share ();
               materialRecord.ParentId = matReq.Id;
               materialRecord.AccessLevel = 'edit';
               materialRecord.UserOrGroupId = groupId[0].Id ;
               matReqShare.add(materialRecord);
        }
        
         Database.insert(matReqShare);
             
  }
}