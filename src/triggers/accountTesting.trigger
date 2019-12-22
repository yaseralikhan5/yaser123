trigger accountTesting on Account (before update) {
    if(trigger.isbefore && trigger.isupdate){
        accountTesting obj=new accountTesting();
        obj.populate(trigger.oldMap,trigger.newMap);
    }
}