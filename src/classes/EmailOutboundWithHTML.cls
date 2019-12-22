public class EmailOutboundWithHTML {
    public static void emailme(list<customer_bank__c> cus){
        list<customer_bank__c> customer=new list<customer_bank__c>();
        for(customer_bank__c c:cus){
            if(c.firstname__c=='yaser'){
                customer_bank__c cc=new customer_bank__c();
                cc.FirstName__c=c.firstname__c+'khan';
           cc.Id=c.Id;
                customer.add(cc);
        
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
                
                string[] s=new string[]{userinfo.getUserEmail()};
        msg.setToAddresses(s);
        msg.setSubject('The record is updated');
        string b='Dear '+userinfo.getFirstName()+'<br/>';
                b=b+'This is to inform you that the fields have been updated.<br/>';
                b=b+'Name: '+c.FirstName__c+'<br/>';
                b=b+'state: '+c.States__c+'<br/>';
                b=b+'Regards <br/> Management.';
                msg.sethtmlbody(b);
                messaging.Email[] emails=new messaging.Email[]{msg};
                    messaging.sendEmail(emails);
       }
            }
        update customer;
           }
}