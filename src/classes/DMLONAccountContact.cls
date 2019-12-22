public class DMLONAccountContact {

    public list<account> acc {set;get;}
    public boolean flag {set;get;}
    public DMLONAccountContact()
    {
        acc=[select name,industry,phone,(select firstname,lastname from contacts) from account];
        
    }
    
    

}