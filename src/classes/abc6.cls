public class abc6 {
   /* public list<accountdata_wrapper> rap {set;get;}
    public accountdata_wrapper wrap {set;get;}
    public list<account> ab {set;get;}
    public abc6()
    {
        rap=new list<accountdata_wrapper>();
        wrap=new accountdata_wrapper();
        //create();
    }
    public void create()
    {
        insert wrap.a;
       
    }*/
    public list<account> acc{set;get;}
    public account a{set;get;}
    public integer count;
    public abc6()
    {
        count=0;
        acc=new list<account>();
        a=new account();
    }
public void create()
{
   
    insert a;
a=new account();
    count++;
   acc=[select name, industry,phone from account order by createddate desc limit :count];
}

}