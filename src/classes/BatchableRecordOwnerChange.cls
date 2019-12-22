global class BatchableRecordOwnerChange implements database.Batchable<sobject>,database.stateful {
    public user d;
    global database.QueryLocator start(database.BatchableContext bc){
        d=[select id from user where name='naveed ali khan'];
       string s1='Hot';
        string s='select id ,name,type from account';
        return database.getQueryLocator(s);
    }
    global void execute(database.BatchableContext bc, list<account> acc){
        for(account a:acc)
        {
           a.OwnerId=d.Id;
        }
        update acc;
        
    }
    global void finish(database.BatchableContext bc){
        
    }

}