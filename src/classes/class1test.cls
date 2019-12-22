public class class1test {

    public void update1()
    {
        list<account> acc1=[select industry,phone from account ];
        for(account a:acc1)
        {
            a.industry='banking';
            a.phone='1234';
        }
        update acc1;

    }
    public void update2()
    {
        list<account> acc2=[select ownerid from account where createddate=today];
        user u=[select id from user where name='naveed ali khan'];
        for(account a:acc2)
        {
           a.OwnerId=u.id;
        }
        update acc2;
    }
}