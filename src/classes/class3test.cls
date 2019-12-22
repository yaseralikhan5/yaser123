public class class3test {
public void insert1(string name,string industry)
{
    account a=new account();
    a.Name=name;
    a.Industry=industry;
    insert a;
}
    public void update1()
    {
        list<account> acc1=[select rating,id from account];
        for(account a1:acc1)
        {
            a1.Rating='Hot';
        }
        update acc1;
    }
    public void del1()
    {
        list<account> acc2=[select id from account where createddate=today];
        delete acc2;
    }
}