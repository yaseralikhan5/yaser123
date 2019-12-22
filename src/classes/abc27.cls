public class abc27 implements messaging.InboundEmailHandler {
    public Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope env){
        string email1=email.fromAddress;
        contact con=[select id from contact where email=:email1];
        messaging.InboundEmailResult result=new messaging.InboundEmailResult();
        try{
            case c=new case();
            c.ContactId=con.id;
            c.Subject=email.subject;
            c.Status='new';
            c.Priority='normal';
            c.Description=email.plainTextBody;
            insert c;
            result.success=true;
            
            messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
            string[] s=new string[]{userinfo.getUserEmail()};
                msg.setToAddresses(s);
            msg.setSubject('This is a test method');
            msg.setPlainTextBody('this is a plain text');
            messaging.SingleEmailMessage[] sm=new messaging.SingleEmailMessage[]{msg};
                messaging.sendEmail(sm);
        }
        catch(exception e){
            result.success=false;
        }
        return result;
        
    }
}