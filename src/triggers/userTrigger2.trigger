trigger userTrigger2 on User (after insert) {
profile p=[select id , name from profile where name='customer community khan'];
    list<contact> con=[select id,firstname from contact];
    for(user u:trigger.new){
        if(u.ProfileId==p.id){
            for(contact c1:con){
                if(c1.FirstName!=u.FirstName){
                    account a=new account();
                    a.name=u.FirstName+u.LastName;
                   insert a;
                    contact c=new contact();
                    c.AccountId=a.Id;
                    c.FirstName=u.FirstName;
                    c.LastName=u.LastName;
                    c.Email=u.Email;
                    c.MailingCity=u.City;
                    c.Phone=u.Phone;
                    insert c;
                    accountteammember m=new accountteammember();
                    m.AccountId=a.id;
                    m.UserId=u.Id;
                    m.TeamMemberRole='executive';
                    m.OpportunityAccessLevel='Read';
                    m.AccountAccessLevel='Read';
                    insert m;
                }
            }
        }
    }
}