global  class nov4Btach implements database.Batchable<Sobject>,database.Stateful {
    global  set<id> accounts1;
    global list<account> acct;
    global database.QueryLocator start(database.batchablecontext bc){
        accounts1=new set<id>();
        acct=new list<account>();
        string query='select id,name,industry,rating from account';
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc,list<account> acc123){
        system.debug(acc123);
        for(account a:acc123){
            if(a.name=='yaser28')
            {
                //a.name=a.name+'b1';
                a.Industry='Finance';
                a.Rating='Hot';
                acct.add(a);
                                
            }
        }
        
                list<database.SaveResult> svr=database.update(acct,true);
                for(database.SaveResult s:svr){
                     if(s.isSuccess()){
                         accounts1.add(s.getId());
                     }
                     else
                {
                   // accounts1.add(s.getId());
                }
                }
         
       
   }
    global void finish(database.BatchableContext bc){
        //nov6batch bt1=new nov6batch(accounts1);
        database.executeBatch(new nov6batch(accounts1),5);
    }
    
}