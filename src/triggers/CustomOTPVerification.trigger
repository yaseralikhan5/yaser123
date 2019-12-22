trigger CustomOTPVerification on application__c (before insert,after update) {
    if(trigger.isbefore && trigger.isinsert){
        for(application__c a:trigger.new){
            a.SystemOTP__c='1234';
        }
    }
    if(trigger.isafter && trigger.isupdate){
        map<id,application__c> oldmap=trigger.oldmap;
        map<id,application__c> newmap=trigger.newmap;
        for(id d:oldmap.keySet()){
            application__c old=oldmap.get(d);
            application__c new1=newmap.get(d);
            if(old.ConOTP__c=='' && new1.ConOTP__c !='' && new1.ConOTP__c==old.SystemOTP__c){
                
            }
        }
    }
}