trigger CommunityTriggerContact on Contact (after insert) {
    if(trigger.isafter && trigger.isinsert){
        communityTriggerContact com1=new communityTriggerContact();
        com1.createUser(trigger.new);
    }
}