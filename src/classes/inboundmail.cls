global class inboundmail implements messaging.InboundEmailHandler{
    global messaging.InboundEmailResult handleinboundemail(messaging.InboundEmail mail,messaging.InboundEnvelope ev){
     messaging.InboundEmailResult result=new messaging.InboundEmailResult();
        contact c=new contact();
        c.FirstName=mail.fromName.substring(0,mail.fromName.indexof(''));
        c.LastName=mail.fromName.substring(mail.fromname.indexof(''));
        c.Email=mail.fromAddress;
        insert c;
        if(mail.binaryAttachments!=null && mail.binaryAttachments.size()>0){
            for(integer i=0;i<mail.binaryAttachments.size();i++){
                attachment attach=new attachment();
                attach.name=mail.binaryAttachments[i].filename;
                attach.Body=mail.binaryAttachments[i].body;
                attach.ParentId=c.Id;
                insert attach;
            }
        }
        return result;
    }
}