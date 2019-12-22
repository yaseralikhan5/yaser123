global class BatchableUserChangeRecordRedirect implements database.Batchable<sobject> {
public id userid;
    public id managerid;
    global BatchableUserChangeRecordRedirect(id userid,id managerid)
    {
        this.userid=userid;
        this.managerid=managerid;
    }
    global database.QueryLocator start(database.BatchableContext bc){
        string query='select id from customer_bank__c where ownerid=:\''+userid+'\'';
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc,list<customer_bank__c> lists){
        
        for(customer_bank__c c:lists){
            c.ownerid=managerid;
            
        }
        update lists;
    }
    global void finish(database.BatchableContext bc){
        
    }
}