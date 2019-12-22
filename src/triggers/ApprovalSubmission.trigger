trigger ApprovalSubmission on Lab__c (after insert) {
    if(trigger.isafter && trigger.isinsert){
        ApprovalSubmission sub=new ApprovalSubmission();
        sub.invoke(trigger.new);
        //string acc=json.serialize(trigger.new);
       // sub.invoke(acc); 
    }
}