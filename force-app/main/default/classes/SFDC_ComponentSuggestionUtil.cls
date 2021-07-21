public class SFDC_ComponentSuggestionUtil {
	public string searchstring {get;set;} 
    public list<ApexPage> compListVF {get;set;}
    public list<ApexClass> compListAPX {get;set;}
    public list<ApexTrigger> compListAPXT {get;set;}
    public String compType {get;set;}
    
     public List < SelectOption > getComponentType(){
        List<SelectOption> optionsToReturn = new List<SelectOption>();
        optionsToReturn.add(new SelectOption('','-- None --'));
        optionsToReturn.add(new SelectOption('VFP','Visualforce Page'));
        optionsToReturn.add(new SelectOption('APXC','Apex Class'));
        optionsToReturn.add(new SelectOption('APXT','Apex Trigger'));
        return optionsToReturn;
    }
    public void compImpl(){
        if(compType=='VFP'){
            if(compListAPX != null){
                compListAPX.clear();
            }
             if(compListAPXT != null){
                compListAPXT.clear();
            }
        string searchquery='select name,id from ApexPage where name like \'%'+searchstring+'%\' Limit 10'; 
		compListVF= Database.query(searchquery);    
        }
          if(compType=='APXC'){
                if(compListVF != null){
                compListVF.clear();
            }
               if(compListAPXT != null){
                compListAPXT.clear();
            }
        string searchquery1='select name,id from ApexClass where name like \'%'+searchstring+'%\' Limit 10'; 
		compListAPX= Database.query(searchquery1);  
        }
        if(compType=='APXT'){
            if(compListAPX != null){
                compListAPX.clear();
            }
             if(compListVF != null){
                compListVF.clear();
            }
            string searchquery2='select name,id from ApexTrigger where name like \'%'+searchstring+'%\' Limit 10';
            compListAPXT= Database.query(searchquery2); 
            }
        
    }
      public void clear(){
          searchstring='';
          if(compType=='VFP'){
         compListVF.clear();   
          }else if(compType=='APXC'){
          compListAPX.clear();
          }else if(compType=='APXT'){
          compListAPXT.clear();    
          }
    }
}