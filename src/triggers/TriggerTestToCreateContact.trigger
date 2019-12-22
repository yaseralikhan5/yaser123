trigger TriggerTestToCreateContact on Account (after insert) {
    if(trigger.isafter && trigger.isinsert){
        TriggerTestApexClassCreateContact t=new TriggerTestApexClassCreateContact();
        t.triggerMethod1(trigger.new);
    }
}