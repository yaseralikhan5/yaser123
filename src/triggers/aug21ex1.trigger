trigger aug21ex1 on Candidate_Enquiry__c (after insert) {
    if(trigger.isafter && trigger.isinsert){
        aug21ex1 obj=new aug21ex1();
        obj.invoke(trigger.new);
    }
}