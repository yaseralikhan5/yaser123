trigger Oct27AccountEx1 on Account (after insert) {
account__c sk=account__c.getinstance(userinfo.getUserId());
    if(sk.triggerskip__c==true){
        user u=[select id from user where alias='naveed'];
        for(account a:trigger.new){
            if(a.annualrevenue > 500000){
                accountteammember mem=new accountteammember();
                mem.AccountId=a.id;
                mem.UserId=u.Id;
                mem.TeamMemberRole='AccountManager';
                mem.AccountAccessLevel='All';
                insert mem;
            }
        }
    }
    }