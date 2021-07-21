@istest
public class GetHotelDetailsControllerTest {
    
    @istest
    public static void GetHotelDetailsControllerTestMethod(){
        
        list<Hotel__c> hotels=new list<Hotel__c>();
        test_hotel_custom_setting__c thcs= new test_hotel_custom_setting__c();
        thcs.Name='Test';
        thcs.enable_hotel_trigger1__c=true;
        insert thcs;
        system.debug('inside test class '+ thcs );
        Date bookingDate = Date.parse('12/15/15');
        Location__c loc=new Location__c(Country__c='India',Experience__c='awesome',visited_Date__c=bookingDate,WillSuggest__c=true);
        Travel_Agent__c ta=new Travel_Agent__c(Name='MakeMyTrip');
        insert loc;
        insert ta;
        Hotel__c hotelInsert=new Hotel__c(Name='test_hotel',City__c='Leeds',Location__c=loc.id,Travel_Agent__c=ta.id,Number_of_Rooms__c=3,Room_rent_amount__c=1000,Contact_No__c= '9876565656',Is_Room_Available__c=true);
        hotels.add(hotelInsert);
        insert hotels;
		ApexPages.currentPage().getParameters().put('id',hotelInsert.Id);
        ApexPages.StandardController sc = new ApexPages.StandardController(hotelInsert); 
        GetHotelDetailsController gh=new GetHotelDetailsController(sc);
       
    }

}