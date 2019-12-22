public class flowclass {
@invocablemethod
    public static void populate(list<string> ids){
        contact c=new contact();
        c.LastName='khan';
        c.FirstName='flow';
        c.AccountId=ids[0];
        insert c;
    }
}