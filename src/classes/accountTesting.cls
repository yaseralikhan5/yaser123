public class accountTesting {
 public void populate(map<id,account> oldmap,map<id,account> newmap){
     emailtemplate et=[select id from emailtemplate where name='accountTesting'];
     contact c=[select id from contact limit 1];
        for(id d:oldmap.keyset()){
            account oldvalue=oldmap.get(d);
            account newvalue=newmap.get(d);
            if(oldvalue.industry!=null && oldvalue.industry!=newvalue.industry){
                messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
                string[] str=new string[]{'yaseralikhan8@gmail.com'};
                msg.setToAddresses(str);
                msg.setSaveAsActivity(false);
                msg.setTargetObjectId(c.id);
                msg.setTemplateId(et.Id);
               msg.setWhatId(d);
                messaging.Email[] mails=new messaging.Email[]{msg};
                    messaging.sendEmail(mails);
            }
        }
    }
}