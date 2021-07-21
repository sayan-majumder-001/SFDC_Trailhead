public without sharing class Parul{
    

@AuraEnabled
public static string getnoteInsertion(string recordId,string textValue){
    try{
    ContentNote objNote = new ContentNote();
    objNote.Title = 'Note added on '+string.valueof(system.now());
    objNote.content=Blob.valueOf(textValue);
    database.insert(objNote);

    ContentDocumentLink cl = new ContentDocumentLink();
    cl.ContentDocumentId = objNote.Id;
    cl.ShareType='v';
    cl.LinkedEntityId = recordId;
    database.insert(cl);
    
    PMMP_Material_Request__c materialUpdate = new PMMP_Material_Request__c(id=recordId,PMMP_Comments__c=textValue);
    database.upsert(materialUpdate);
    return 'Success';
    }
    catch(exception ex){
        return ex.getMessage();
    }

}
}