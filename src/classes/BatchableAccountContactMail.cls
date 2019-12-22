global class BatchableAccountContactMail implements database.Batchable<sobject>,database.stateful,schedulable {
    global database.QueryLocator start(database.BatchableContext bc){
        string s='select id,name,(select firstname,lastname,phone from contacts) from account where name =\'yaser \'  ';
        return database.getQueryLocator(s);
    }
    global void execute(database.BatchableContext bc,list<account> acc){
       list<contact> cc=new list<contact>();
        for(account a:acc){
           
            for(contact c:a.contacts){
                c.lastname='Khan';
                cc.add(c);
            }
        }
        update cc;
    }
    global void finish(database.BatchableContext bc){
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        string[] s=new string[]{userinfo.getUserEmail()};
        msg.setToAddresses(s);
        msg.setSubject('THis is a trial mail');
        msg.setPlainTextBody('the mail is successfully sent');
        messaging.SingleEmailMessage[] email=new messaging.SingleEmailMessage[]{msg};
            messaging.sendEmail(email);
    }

    public void execute(schedulablecontext sc){
        BatchableAccountContactMail abc=new BatchableAccountContactMail();
        database.executeBatch(abc);
    }    
}