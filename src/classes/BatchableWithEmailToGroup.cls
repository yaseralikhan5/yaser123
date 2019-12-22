global class BatchableWithEmailToGroup implements database.Batchable<Sobject>,database.stateful{
    public user u1,u2;
    public group g;
   
    public list<groupmember> g1;
    global database.QueryLocator start(database.BatchableContext bc){
        u1=[select id from user where name='ghori khan'];
        u2=[select id from user where name='naveed ali khan'];
       
        string s='select id,firstname__c,states__c,ownerid from customer_bank__c';
       return database.getQueryLocator(s);
    }
    global void execute(database.BatchableContext bc,list<customer_bank__c> l){
        for(customer_bank__c c:l){
            c.ownerid=u1.id;
        }
        update l;
    }
    global void finish(database.BatchableContext bc){
         g=[select id from group where name='public_test2'];
        g1=[select userorgroupid from groupmember where groupid=:g.id];
        list<user> ulist=new list<user>();
        for(groupmember g2:g1)
        {
            user u=[select id,email from user where id=:g2.userorgroupid];
            ulist.add(u);
        }
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        string s=userinfo.getUserEmail();
        string[] email1=new string[]{s};
            
            msg.setToAddresses(email1);
       list<string> sf=new list<string>();
        for(user i:ulist){
            sf.add(i.Email);
        }
        //string[] Gemail=new string[]{g.Email};
            msg.setBccAddresses(sf);
        msg.setSubject('A record is updated with jobid: '+bc.getJobId());
        string s1='<b>Dear '+userinfo.getFirstName()+'<b><br/>';
        s1=s1+'This is to inform you that the record in the customer database has been updated and assign to you.This is for your reference';
        s1=s1+'<br/>Regards,<br/>Management';
        msg.setHtmlBody(s1);
        messaging.Email[] e=new messaging.Email[]{msg};
        messaging.sendEmail(e);
    }
}