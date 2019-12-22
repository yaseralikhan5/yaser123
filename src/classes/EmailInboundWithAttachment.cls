public class EmailInboundWithAttachment implements messaging.InboundEmailHandler{
    public messaging.InboundEmailResult handleInboundEmail(messaging.InboundEmail email,messaging.InboundEnvelope env){
        messaging.InboundEmailResult result=new messaging.InboundEmailResult();
        try{
        string inboundmail=email.fromAddress;
        contact con=[select id from contact where email=:inboundmail limit 1];
        case c=new case();
        c.ContactId=con.id;
        c.Description=email.plainTextBody;
        c.Status='new';
        c.Subject=email.subject;
        c.Priority='Normal';
        insert c;
        messaging.InboundEmail.binaryAttachment[] files=email.binaryAttachments;
        list<attachment> attch=new list<attachment>();
        for(messaging.InboundEmail.binaryAttachment binary:files){
            attachment att=new attachment();
            att.Name=binary.filename;
            att.Body=binary.body;
            att.ParentId=c.Id;
            attch.add(att);
        }
        insert attch;
        result.success=true;
        }
        catch(exception e){
            result.success=false;
        }
        return result;
            
        }
        
    }











/*public class abc24 {
    public wrapperabc16 wrap {set;get;}
    public abc24(){
        
    }
    public abc24(wrapperabc16 wrap){
        this.wrap=wrap;
    }
    public pagereference submit(){
       // abc25 abc=new abc25(wrap);
        account a=wrap.accounts;
        
        insert a;
        pagereference p=new pagereference('/apex/abc25');
        return p;
    }

}*/