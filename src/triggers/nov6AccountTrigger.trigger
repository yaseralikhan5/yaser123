trigger nov6AccountTrigger on Account (after insert,before update) {
    if(trigger.isafter && trigger.isinsert || trigger.isbefore && trigger.isupdate){
       // Nov6TriggerClass nov=new Nov6TriggerClass();
        string json=json.serialize(trigger.new);
        Nov6TriggerClass.invoke(json);
    }
}