trigger TestLogObjTrigger on TestLogObject__c (after insert) {
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            TestLogObjTriggerHandler.updateAccountLatestLogTime(trigger.new);
        }
    }

}