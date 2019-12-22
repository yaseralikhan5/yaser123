public class nov8ex1 implements database.Batchable<Sobject>{
    public database.QueryLocator start(database.BatchableContext bc){
        string query='select id,name,stagename from opportunity';
        return database.getQueryLocator(query);
    }
    public void execute(database.batchablecontext bc,list<opportunity> acc){
        for(opportunity a:acc){
            if(a.stagename=='Closed Lost'){
               a.stagename='Closed Won';
                  update a;
            }
        }
    }
    public void finish(database.Batchablecontext bc){
        
    }

}