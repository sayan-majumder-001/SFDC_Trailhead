public class FinalBookingAmount{
public static void applyDiscount(Hotel__c[] hotels) {
       for (Hotel__c h :hotels){
          h.Final_rent_amount__c = h.Total_booking_Price__c*0.9;
          
       }
    }
    }