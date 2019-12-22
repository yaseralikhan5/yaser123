trigger ApprovalTriggerAccount on Account (after insert) {
    if(trigger.isbefore && trigger.isinsert){
        ApprovalTriggerClass tri=new ApprovalTriggerClass();
        tri.approval(trigger.new);
    }

}