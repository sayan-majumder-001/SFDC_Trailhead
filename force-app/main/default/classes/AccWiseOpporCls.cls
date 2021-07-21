public class AccWiseOpporCls {
    
    public String accountID{get;set;}
    public list<Account> accountList;
    public list<Opportunity> opporList{get;set;}
    public Integer totalCountOppor{get;set;}
    
    public AccWiseOpporCls(){
        accountlist=[select name,Id from Account Limit 100 ];
    }
    
    public list<SelectOption> getAcctItems(){
        List<SelectOption> opporOption=new List<SelectOption>();
        opporOption.add(new SelectOption('0', 'None'));
        for(Account acc: accountList){
            opporOption.add(new SelectOption(acc.Id, acc.name));
        }
        
        return opporOption;
    }
    
    public void displayOpportunity(){
        System.debug('inside opportunity showing');
        if(accountID != '0'){
            opporList= [select Name,ExpectedRevenue from Opportunity where accountId =:accountID];
            totalCountOppor = opporList.size();
        }
    }
    

}