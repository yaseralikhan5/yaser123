trigger ChequeMiniProject5 on Cheque_Details__c (after insert) {
    if(trigger.isafter && trigger.isinsert){
       ChequeMiniproject5 obj=new ChequeMiniproject5();
        obj.cheque(trigger.new);
    }
}