global class oct26ex1 implements database.batchable<sobject>,database.stateful {
   
    global database.QueryLocator start(database.BatchableContext bc){
       return database.getquerylocator('select id,name,industry,rating from account');
    }
    global void execute(database.BatchableContext bc, list<account> acc){
        for(account a:acc){
            a.industry='Retail';
            
        }
        update acc;
        
    }
    global void finish(database.BatchableContext bc){
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        string[] addr=new string[]{'yaseralikhan8@gmail.com'};
        msg.setToAddresses(addr);
        string str='Dear sir <br/> We are delighted to inform you that your batch has been executed successfully with the v=batch number'+bc.getJobId();
        msg.plaintextbody=str;
        msg.setSubject('Batch apex test mail');
        messaging.EmailFileAttachment files=new messaging.EmailFileAttachment();
        messaging.Email[] mails=new messaging.Email[]{msg};
        messaging.sendEmail(mails);
    }
   
}