public class couponTriggerClass {

    public string type;
    public list<string> email1;
    public Decimal code;
    public void insert1(list<coupon__c> cou){
        email1=new list<string>();
        for(coupon__c c:cou){
            type=c.type__c;
            c.coupon_code__c=math.round(math.random()*900000+100000);
            code=c.coupon_code__c;
        }
        list<account> acc=[select id,(select id,email from contacts) from account where type__c=:type ];
        for(account a:acc){
            for(contact c1:a.contacts){
                email1.add(c1.email);
            }
        }
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
      msg.setSubject('The coupon code: '+ code +' is generated');
        msg.setToAddresses(email1);
        msg.setPlainTextBody('This is to inform you that the coupon code has been generated');
        messaging.Email[] mail=new messaging.Email[]{msg};
            messaging.SendEmail(mail);
    }
}