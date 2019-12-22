global class BatchApexTestApexClass implements database.Batchable<sobject> {
    global database.QueryLocator start(database.BatchableContext bc){
        string query ='select id ,stagename from opportunity';
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc, list<opportunity> opp){
        for(opportunity p:opp){
            p.StageName='prospecting';
            p.CloseDate=system.today();	
        }
        update opp;
    }
    global void finish(database.BatchableContext bc){
        
    }

}