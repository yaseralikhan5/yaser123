public class Nov6TriggerClass {
    public static list<id> d1;
    public Nov6TriggerClass(){
        d1=new list<id>();
    }
    public static void invoke(string str){
        //list<id> d1=new list<id>();
        //id d1;
        list<account> accounts=new list<account>();
        list<account> acc=(list<account>)json.deserialize(str, list<account>.class);
        for(account a:acc){
            if(a.industry=='Retail'){
                a.Industry='Finance';
                accounts.add(a);
                d1.add(a.Id);
            }
        }
        update accounts;
        mailInvoke(d1);
    }
    @future(callout=true)
    public static void mailInvoke(list<id> ids){
       account acc=[select id,name from account where id in :ids limit 1];
       acc.name='yasertest1';
       update acc;
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        string[] addr1=new string[]{'yaseralikhan5@gmail.com'};
        msg.setToAddresses(addr1);
        msg.setSubject('This is a test mail from trigger class');
        msg.setPlainTextBody('These are the account names for whom the updation has been done');
        messaging.Email[] mails=new messaging.Email[]{msg};
            messaging.sendEmail(mails);
    }
}