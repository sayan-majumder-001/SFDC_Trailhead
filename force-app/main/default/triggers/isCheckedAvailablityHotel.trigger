trigger isCheckedAvailablityHotel on Hotel__c (before insert,before update) {
    
    
    test_hotel_custom_setting__c  thcs=test_hotel_custom_setting__c.getValues('Test'); 
    
    if(thcs.enable_hotel_trigger1__c==true){
    for(Hotel__c hotel : Trigger.New ){
        if(hotel.Is_Room_Available__c==true && hotel.Number_of_Rooms__c==null || hotel.Number_of_Rooms__c==0){
            hotel.Number_of_Rooms__c.addError('Number of rooms should be greater than zero');
           } 
            
        }
    }

}