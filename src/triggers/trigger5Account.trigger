trigger trigger5Account on Account (after update,before delete) {
    if(trigger.isafter && trigger.isupdate)
    {
trigger5Account.submit(Trigger.OldMap, Trigger.Newmap);
    }
    if(trigger.isbefore && trigger.isdelete)
    {
        trigger5Account.delete1(trigger.old);
        
    }
}