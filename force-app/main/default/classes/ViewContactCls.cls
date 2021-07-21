public class ViewContactCls {
  	public Id accID;
    public List<Contact> lstCon;
    public String conJsonStr {get;set;}
    public ViewContactCls(ApexPages.StandardController cs){
        accID =  ApexPages.currentPage().getParameters().get('id');
        conJsonStr = '{}';
        if(accID != null){
            lstCon = [Select ID,Name,BirthDate,email from Contact where AccountID =: accID];
            conJsonStr= JSON.serialize(lstCon);
            system.debug('============'+ conJsonStr);
        }
    }
    
}