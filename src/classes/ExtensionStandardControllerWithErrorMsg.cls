public class ExtensionStandardControllerWithErrorMsg {
    public account acc {set;get;}
    public contact con {set;get;}
    public opportunity opt {set;get;}
    public ExtensionStandardControllerWithErrorMsg(apexpages.StandardController controller)
    {
        acc=(account)controller.getrecord();
        con=new contact();
        opt=new opportunity();
    }
    public pagereference invoke()
    {
        integer count=[select count() from account where name=:acc.name];
        if(count>0){
            apexpages.Message msg=new apexpages.Message(apexpages.Severity.ERROR,'Duplicate records');
            apexpages.addMessage(msg);
        }
        else
        {
            insert acc;
        }
        con.accountid=acc.id;
        insert con;
        opt.accountid=acc.id;
        insert opt;

        pagereference p=new pagereference('/'+acc.id);
        return p;
    }

}