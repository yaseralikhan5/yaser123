global class nov6batch implements database.Batchable<Sobject>,database.Stateful,database.AllowsCallouts{
    global set<id> accid;
    global list<account> acct1;
    global list<id> accid1;
    global  nov6batch(){}
    global  nov6batch(set<id> accounts1){
         accid=new set<id>();
        accid1=new list<id>();
        acct1=new list<account>();
        accid=accounts1;
    }
    global database.QueryLocator start(database.batchablecontext bc){
        string query='select id,name from account where id in :'+accid;
        return database.getQueryLocator(query);  
    }
    global void execute(database.BatchableContext bc,list<account> acc){
        for(account a:acc){
            if(a.name.contains('yaser')){
                 a.name=a.name+'b2';
                a.Rating='Warm';
                 acct1.add(a);
            }
        }
        database.SaveResult[] svr=database.update(acct1,false);
        for(database.SaveResult s:svr){
            if(s.issuccess()){
                accid1.add(s.getId());
            }
            else
            {
                
            }
        }
    }
    global void finish(database.BatchableContext bc){
        list<contact> con=[select id,email from contact where accountid in :accid1];
        list<string> mails=new list<string>();
        for(contact c:con){
            mails.add(c.email);
        }
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        msg.setToAddresses(mails);
        msg.setSubject('This is a success mail');
        msg.setPlainTextBody('This is to inform you that the record has been updated at account level');
        messaging.Email[] mail1=new messaging.Email[]{msg};
        messaging.sendEmail(mail1);
    }
}