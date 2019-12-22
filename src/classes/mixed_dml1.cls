public class mixed_dml1 {
public void create()
{
    profile p=[select id from profile where name='student'];
    userrole r=[select id from userrole where name='ITSales'];
    user u=new user(alias ='ali', email='yaseralikhan8@gmail.com', 
            emailencodingkey='UTF-8', lastname='ali', 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username='alikhanhyd@123.com');
    insert u;
    account a=[select id from account where name like '%yaser%' limit 1];
    invoke(a.id);
    
}
    
    @future(callout=true)
   public static void invoke(id d)
   {
       account a=[select id from account where id=:d];
       delete a;
   }
}