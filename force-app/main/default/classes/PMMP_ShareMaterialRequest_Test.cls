@istest
public without sharing class PMMP_ShareMaterialRequest_Test {
    
    static testmethod void TestShareRecord() {
        String locationCode = 'P655';
        List<Group> groupId = [select id from group where name like : locationCode];
        PMMP_Material_Request__c matReq = new PMMP_Material_Request__c();
        matReq.PMMP_Material_Request_Name__c = 'TestMat';
        insert matReq;

        List<PMMP_Material_Request__Share> matShare =new List<PMMP_Material_Request__Share>();
        system.debug('matShare '+ matShare);
		//matShare.ParentId = matReq.Id;
        //matShare.AccessLevel = 'edit';
		//matShare.UserOrGroupId = groupId[0].Id ;
		 insert matShare;
		 List<ID> idList= new List<ID>();
        idList[0]=matReq.Id;
		//[SELECT Id, UserOrGroupId, AccessLevel FROM PMMP_Material_Request__Share WHERE ParentId = :matReq.Id AND UserOrGroupId= :groupId[0].id];
        PMMP_ShareMaterialRequest.shareMaterialRequests(idList);
         System.assertEquals(matShare.size(), 1, 'Set the object\'s sharing model to Public Read Only.');
         System.assertEquals(matShare[0].AccessLevel, 'edit');
         System.assertEquals(matShare[0].UserOrGroupId, groupId[0].id);

}

}