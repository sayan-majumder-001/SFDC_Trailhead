public class GetHotelDetailsController {
    
    public list<Hotel__c> hotelData{get;set;}  
    public id hotelId;
    
 public GetHotelDetailsController(apexpages.StandardController cs)
 {
     hotelId=  ApexPages.currentPage().getParameters().get('id');  
     hotelData=null;
     System.debug('Demo HotelName '+ hotelId);
       
    if(hotelId != null)
    {
            hotelData = [Select City__c,Description__c,Location__c,Travel_Agent__c,Number_of_Rooms__c,Rating__c,Total_booking_Price__c from Hotel__C where id =: hotelId];
        System.debug('Hotel Json '+ hotelData);
    }
 }
  
}