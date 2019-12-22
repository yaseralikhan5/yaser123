public class class2test {

    public void create(string name,string industry)
    {
        account l=new account();
        l.Name=name;
       
        l.Industry=industry;
        insert l;
    }
    public void invoke(string name, string industry)
    {
        integer count=[select count() from account where name=:name];
        if(count<=0)
        {
             account l1=new account();
        l1.Name=name;
       
        l1.Industry=industry;
        insert l1;
        }
    }
}