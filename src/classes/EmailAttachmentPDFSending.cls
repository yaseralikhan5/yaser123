public class EmailAttachmentPDFSending {
   public void invoke()
   {
       document doc=[select id, name,body from document where name='bank'];
       messaging.EmailFileAttachment et1=new messaging.EmailFileAttachment();
       et1.setFileName(doc.name+'.jpg');
       et1.setBody(doc.Body);
       
       pagereference p=page.abc24;
       blob body=p.getContentAsPDF();
       messaging.EmailFileAttachment et2=new messaging.EmailFileAttachment();
       et2.setBody(body);
       et2.setFileName('abc24 visual page');
       messaging.EmailFileAttachment[] email=new messaging.EmailFileAttachment[]{et1,et2};
           
           messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
       string[] s=new string[]{'yaseralikhan8@gmail.com'};
       msg.setToAddresses(s);
       msg.setPlainTextBody('This is a plain text email');
       msg.setSubject('This mail consist of attachments');
       msg.setFileAttachments(email);
       
       messaging.Email[] emails=new messaging.Email[]{msg};
           messaging.sendEmail(emails);
   }

}