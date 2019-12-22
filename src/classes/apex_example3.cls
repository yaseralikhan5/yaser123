public class apex_example3 {
    public account acc {set;get;}
    public contact con {set;get;}
    public apex_example3()
    {
        acc=new account();
        con=new contact();
    }
public PageReference create()
{
   PageReference p;
    try{
        insert acc;
        con.AccountId=acc.Id;
        insert con;
        p=new PageReference('/'+acc.Id);
       
    }
     
    catch(exception e)
    {
        apexpages.Message msg=new apexpages.message(apexpages.Severity.ERROR,' '+e.getCause());
       apexpages.addMessage(msg);
        // msg =new Apexpages.Message(Apexpages.Severity.Error,''+e.getCause());
           //  Apexpages.addMessage(msg);
    }
    return p;
}
    public void cancel()
    {
        acc=new account();
        con=new contact();
       
    }
}