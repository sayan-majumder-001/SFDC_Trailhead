@istest
public without sharing class PMMP_SendEmailController_Test {

    static testmethod void TestCountRecord() {
        
     /*list<PMMP_Plant__c> plantData = PMMP_TestHandlerUtility.createPlantTestData(1);
        insert plantData;
        
        list<PMMP_WBS_Code__c> wbsData = PMMP_TestHandlerUtility.createWBSTestData(1);
        insert wbsData;
        
        PMMP_Internal_Order__c interalOrder =  PMMP_TestHandlerUtility.createInternalOrder(wbsData[0].id);
        insert interalOrder;
        
        list<product2> products = PMMP_TestHandlerUtility.createProductData(2);
        insert products;
        list<String> productsId = new list<String>();
        for(product2 product : products) {
            
            productsId.add(product.Id);
        }*/
        
        
        PMMP_Material_Request__c material = new PMMP_Material_Request__c();
        material.PMMP_Internal_Order__c = 'interalOrder.Id';
        material.PMMP_Plant_Warehouse_Location__c = 'plantData[0].Id';
        material.PMMP_WBS_Element__c = 'wbsData[0].Id';
        
        
        insert material;
        
       /* list<user> testUsers = PMMP_TestHandlerUtility.testDataUser(2);
        database.insert(testUsers);
        system.runas(testUsers[0]) { */
         
          test.startTest();
            
            List<PMMP_Material_Request__c> mat = PMMP_SendEmailController.updateCount(material.id);
            List<PMMP_Material_Request__c> mat2 = PMMP_SendEmailController.updateCount('Test');
          test.stopTest();
          System.assertNotEquals(mat.size(),0);
          System.assertEquals(mat2.size(),0);  
  /*}*/
    } 
    
    
    
    static testmethod List<PMMP_Material_Request__c> TestCountRecordFail() {
        
        
        PMMP_Material_Request__c material = new PMMP_Material_Request__c();
        material.PMMP_Internal_Order__c = 'interalOrder.Id';
        material.PMMP_Plant_Warehouse_Location__c = 'plantData[0].Id';
        material.PMMP_WBS_Element__c = 'wbsData[0].Id';
        insert material;
        
        try{
          test.startTest();       
             throw new MyException();
        }
  /*}*/
         catch(exception ex) {
       return new list<PMMP_Material_Request__c>();
   }
   
    } 
}