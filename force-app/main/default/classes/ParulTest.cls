@istest
public class ParulTest {
    
@istest 
    static String TestGetnoteInsertion(){
     String value='TestValue';
    ContentNote objNote = new ContentNote();
    objNote.Title = 'Note added on '+string.valueof(system.now());
    objNote.content=Blob.valueOf(value); 
    PMMP_Material_Request__c pmp= new PMMP_Material_Request__c();
    pmp.PMMP_Comments__c='Test';
    insert pmp;
    String recordId=pmp.Id;
    String result=Parul.getnoteInsertion(recordId,value); 
    PMMP_Material_Request__c materialUpdate = new PMMP_Material_Request__c(id=recordId,PMMP_Comments__c=Value);
    update materialUpdate;
    return 'Success';
      
    }
    
    @istest 
    static void TestGetnoteInsertionFail(){
     String value='TestValue';
     Account acc1 = new Account();
    acc1.Name='acc1';
    insert acc1;
    String recordId=acc1.Id;
    Parul.getnoteInsertion(recordId,value); 
    PMMP_Material_Request__c materialUpdate = new PMMP_Material_Request__c(id=recordId,PMMP_Comments__c=Value);
    update materialUpdate;
    }

}