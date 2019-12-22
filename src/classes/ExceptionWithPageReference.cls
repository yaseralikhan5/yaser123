public class ExceptionWithPageReference {
    public account acc {set;get;}
    public ExceptionWithPageReference()
    {
        acc=new account();
    }
    public pagereference submit()
    {
         pagereference p;
        try{
            
           
            integer count=[select count() from account where Name =:acc.Name];
            if(count>0)
            {
                Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.Error,'Duplicate record found');
                Apexpages.addMessage(msg);   
            }
            else
            {
                insert acc;
                p=new pagereference('/'+acc.id);
                
            }
            
        }
        
        catch(exception e)
        {
            Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.Error,e.getMessage());
                Apexpages.addMessage(msg);
        }
        return p;
        
            
    }

}