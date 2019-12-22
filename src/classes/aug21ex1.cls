public class aug21ex1 {
   public static list<id> ownerids;
    public static list<id> recordid;
    
   
    
    
    public void invoke(list<candidate_enquiry__c> newval){
         ownerids=new list<id>();
         recordid=new list<id>();
        for(candidate_enquiry__c m:newval){
            ownerids.add(m.OwnerId);
            recordid.add(m.Id);
        }
        invoke1(ownerids,recordid);
        
}
    @future(callout=true)
    public static void invoke1(list<id> owids,list<id> recid){
        list<user> u=[select id,email from user where id in :owids];
        list<string> str=new list<string>();
        for(user u1:u){
            str.add((string)u1.Email);
        }
        messaging.EmailFileAttachment file=new messaging.EmailFileAttachment();
        file.setFileName('TestingVFPage Attached');
        blob b;
        id define;
         for(id d:recid){
             pagereference p=page.aug21ex1;
            p.getParameters().put('id',(string)d);
             define=d;
             b=p.getContentAsPDF();
        }
         
        file.setBody(b);
       
        messaging.EmailFileAttachment[] attach=new messaging.EmailFileAttachment[]{file};
            
       messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        msg.setToAddresses(str);
        msg.setFileAttachments(attach);
        msg.setSubject('testing tesing 123');
        msg.setPlainTextBody('this is the id  '+define);
        msg.setSenderDisplayName('naveed ali khan');
        messaging.Email[] mails=new messaging.Email[]{msg};
            messaging.sendEmail(mails);
    }
}