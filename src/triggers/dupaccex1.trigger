trigger dupaccex1 on Account (before insert) {
    if(trigger.isinsert && trigger.isbefore){
        account__c s=account__c.getinstance(userinfo.getUserId());
        if(s.triggerskip__c){
          list<account> acc=[select name from account];
        for(account a:trigger.new){
            for(account a1:acc){
                if(a.name == a1.name){
                    a.name.adderror('duplicates are not allowed');
                }
            }
        }  
        }        
    }
}