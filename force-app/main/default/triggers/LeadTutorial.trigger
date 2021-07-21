trigger LeadTutorial on Lead (before insert,before update) {
    
   for(Lead newLead: trigger.new)
   {
    
    newLead.Unique_lead_name__c= newLead.email + newLead.FirstName;

}
}