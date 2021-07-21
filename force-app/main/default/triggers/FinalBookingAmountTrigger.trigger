trigger FinalBookingAmountTrigger on Hotel__c (before insert) {
       Hotel__c[] hotels= Trigger.new;
       FinalBookingAmount.applyDiscount(hotels);
    }