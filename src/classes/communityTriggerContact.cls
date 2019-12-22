public class communityTriggerContact {
public set<id> accid;
   public list<user> users;
    public void createUser(list<contact> con){
        accid=new set<id>();
        users=new list<user>();
        profile p=[select id from profile where name='customer community khan' limit 1];
        for(contact c:con){
           //accid.add(c.accountid);
            user u=new user();
            u.Username=c.FirstName+'@123.com';
            u.ContactId=c.Id;
            u.ProfileId=p.Id;
            u.Alias='test123';
            u.Email=c.Email;
            u.EmailEncodingKey = 'UTF-8';
            u.LastName = c.LastName;
            u.CommunityNickname = 'test124';
            u.TimeZoneSidKey = 'America/Los_Angeles';
            u.LocaleSidKey = 'en_US';
            u.LanguageLocaleKey = 'en_US';
			users.add(u);
        }
        insert users;
        
        
    }
}