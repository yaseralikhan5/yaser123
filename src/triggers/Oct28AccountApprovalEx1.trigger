trigger Oct28AccountApprovalEx1 on Account (after insert) {
Account__c ex=Account__c.getinstance(userinfo.getUserId());
   
    if(ex.triggerskip__c==true){
        if(trigger.isafter && trigger.isinsert){
            oct28Ex1TriggerClass c=new oct28Ex1TriggerClass();
            string json=Json.serialize(trigger.new);
            c.invoke(json);
        }       
    }
}