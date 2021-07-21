trigger AccountDeletion on Account (before delete) {

    List<account> account=new List<account>();
   
    // Prevent the deletion of accounts if they have related opportunity.
    for (account a : trigger.old)
    {
    account=[SELECT Id FROM Account
                     WHERE Id IN (SELECT AccountId FROM Opportunity)];
                     
                     if(account.size()>0){

        a.addError('Cannot delete account with related opportunities, please check opportunities section once');

    }
    }
    
}