public class Nov26ChainBatchapex implements database.batchable<sobject>,database.stateful{
    public list<account> accounts;
    public list<id> ids;
    public Nov26ChainBatchapex(){
        accounts=new list<account>();
        ids=new list<id>();
    }
    public database.querylocator start(database.batchablecontext bc){
        string query='select id,name,industry,rating from account';
        return database.getQueryLocator(query);
    }
    public void execute(database.batchablecontext bc, list<account> acc){
        for(account a:acc){
            if(a.Industry=='Retail'){
                a.Rating='Hot';
                accounts.add(a);
            }
        }
        database.SaveResult[] svr=database.update(accounts,false);
        for(database.SaveResult s:svr){
            if(s.isSuccess()){
                ids.add(s.getid());
                
            }
        }
        system.debug(ids);
    }
    public void finish(database.BatchableContext bc){
        Nov26ChainBatchapex1 nov=new Nov26ChainBatchapex1(ids);
        database.executeBatch(nov);
    }

}