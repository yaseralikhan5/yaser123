public class TriggerTestApexClassCreateContact {

    public void triggerMethod1(list<account> acc){
        list<contact> con=new list<contact>();
        for(account a:acc){
            contact c=new contact();
            c.AccountId=a.id;
            c.FirstName =a.Name;
            c.LastName=a.Name;
            con.add(c);
            }
        insert con;
    }
}