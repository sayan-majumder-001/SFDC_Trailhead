public class Date_formatCls {
   public String formatteddata {get;set;}
       public Date_formatCls(){
            DateTime myDateTime = DateTime.newInstance(2018, 03, 07, 13, 30, 0);
			formatteddata = myDateTime.format('MMM d, yyyy hh:mm a');
			System.debug('Date '+ formatteddata);
        }
}