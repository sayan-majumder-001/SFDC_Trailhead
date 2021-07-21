trigger Duplicate_Lead_prevention on Lead (before insert) {
  list<lead> lead = new   list<lead>(); 
 for(lead a: trigger.new)
 {
lead=[select id,name,email from lead where email=:a.email];
  if(lead.size()>0)
  {
   a.email.adderror('email already exist');
  }
 }

}