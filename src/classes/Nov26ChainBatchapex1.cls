public class Nov26ChainBatchapex1 implements database.batchable<sobject>,database.stateful {
    public  list<id> id1;
    public list<account> accounts1;
    public Nov26ChainBatchapex1(){
        id1=new list<id>();
        accounts1=new list<account>();
    }
    public Nov26ChainBatchapex1(list<id> d){
        id1=new list<id>();
        accounts1=new list<account>();
        id1=d;
    }
    public database.QueryLocator start(database.BatchableContext bc){
        system.debug(id1);
        string query='select id,name,industry,rating from account where id in :id1';
        return database.getQueryLocator(query);
    }
    public void execute(database.BatchableContext bc,list<account> acc){
        for(account a1:acc){
            if(a1.industry=='Retail'){
                a1.industry='Finance';
                accounts1.add(a1);
            }
        }
        database.update(accounts1,false);
    }
    public void finish(database.BatchableContext bc){
        
    }
}