public class ExtensionStandardControllerWithMail {
   public list<contact> con {set;get;}
    public account acc {set;get;}
    public ExtensionStandardControllerWithMail(apexpages.StandardController controller){
        list<string> field=new list<string>{'name','industry','phone','rating'};
            controller.addFields(field);
        acc=(account)controller.getRecord();
        
    }
    public pagereference invoke(){
        con=[select id,email from contact where accountid=:acc.id];
        list<string> emails=new list<string>();
        for(contact c:con){
            emails.add(c.email);
        }
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        msg.setToAddresses(emails);
        msg.setSubject('This is a extension example');
        msg.setPlainTextBody('Extension example email sucessfully sent');
        messaging.Email[] mails=new messaging.Email[]{msg};
            messaging.sendEmail(mails);
        pagereference p=new pagereference('/'+acc.id);
        return p;
    }
}