public class AccWiseConCls {
    public String accountID {get;set;}
    public List<Account> AccList;
    public List<Contact> ConList{get;set;}
    public Integer ToatalCon{get;set;}
    public Boolean displayEditPanel{get;set;}
    public contact con{get;set;}
    public integer index{get;set;}
    public AccWiseConCls(){
        AccList =[Select name,Id from Account Limit 100];
        displayEditPanel=false;
        index=0;
        con=null;
    }
    public List<SelectOption> getAccItems(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('0','None'));
        for(Account acc:AccList){
            options.add(new SelectOption(acc.Id,acc.Name));
        }
        return options;
    }
    public void selectAccount(){
        system.debug('Called');
        if(accountID !='0'){
            ConList = [Select FirstName,HomePhone,LastName, Birthdate, Email, MailingCity, MailingState, MailingCountry, MailingPostalCode from Contact where AccountId=: accountID];
            ToatalCon = ConList.size();
        }
            
    }
     public void editContactDetails(){
        displayEditPanel = true;
         if(index <= ConList.size()){
         	con = ConList[index];
         }
         system.debug('======'+index);
     }  
    public void CloseEditPanel(){
        displayEditPanel = false;
    }   
        
}