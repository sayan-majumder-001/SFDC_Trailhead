Public class CustomLinksConsoleHomeController
{
 Public String  Advanced_Markets_Name {get; set;}
 Public String  Advanced_Markets_Value {get; set;}
 
  Public String  CANNEX_Illustrations_Name {get; set;}
 Public String  CANNEX_Illustrations_Value {get; set;}
 
  public CustomLinksConsoleHomeController()
  {
 Custom_Links__c cl = Custom_Links__c.getValues('Advanced_Markets');
 Advanced_Markets_Name =cl.name;
 Advanced_Markets_Value = cl.Link_Url__c;
 
   Custom_Links__c cl1 = Custom_Links__c.getValues('facebook');
 CANNEX_Illustrations_Name =cl1.name;
 CANNEX_Illustrations_Value = cl1.Link_Url__c;
 
 
  }
 }