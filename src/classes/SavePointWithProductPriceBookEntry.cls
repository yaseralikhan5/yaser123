public class SavePointWithProductPriceBookEntry
{
    public Account acc {set;get;}
    public contact con {set;get;}
    public list<abc13product> prod {set;get;}
    public set<string> proname {set;get;}
    public SavePointWithProductPriceBookEntry()
    {
        acc=new Account();
        con=new contact();
        prod=new list<abc13product>();
      // product();
       for(integer i=0;i<3;i++)
       {
            abc13product p13=new abc13product();
             prod.add(p13);
       }
        
    }
    /*public void product()
    {
        
         abc13product p13=new abc13product();
             prod.add(p13);
    
    }*/
    public pagereference fetch()
    {
        SavePoint sp =Database.setSavePoint();
        pagereference p;
        try{
       
        insert acc;
        
        con.AccountId=acc.Id;
        
        insert con;
        opportunity opp=new opportunity();
        opp.name='yaser opp';
        opp.StageName='Prospecting';
        opp.CloseDate=system.today()+15;
        opp.AccountId=acc.Id;
        insert opp;
        proname=new set<string>();
        for(abc13product pr:prod)
        {
            proname.add(pr.name);
        }
        list<product2> p2=[select name,id from product2 where name in :proname];
        map<string,id> productmap=new map<string,id>();
        for(product2 pr2:p2)
        {
            productmap.put(pr2.name,pr2.id);
        }
        list<id> proid=productmap.values();
        list<pricebookentry> pe=[select id,product2id from pricebookentry where product2id in :proid];
        map<id,id> pbeid=new map<id,id>();
        for(pricebookentry pbe:pe)
        {
            pbeid.put(pbe.product2id,pbe.id);
            
        }
        list<id> entryid=pbeid.values();
        list<opportunitylineitem> opt=new list<opportunitylineitem>();
            integer count=0;
        for(abc13product ab:prod)
        {
                  id productid=productmap.get(ab.name);
            
            id bookentryid=pbeid.get(productid);
            opportunitylineitem oli=new opportunitylineitem();
            oli.PricebookEntryId=bookentryid;
            oli.Product2Id=productid;
            oli.OpportunityId=opp.id;
            oli.UnitPrice=10000;
            oli.Quantity=10;
            opt.add(oli);
            
            
        }
        insert opt;
        p=new pagereference('/'+opp.id);
 		
        }
        catch(exception e)
        {
            
           Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.Error,e.getMessage());
                Apexpages.addMessage(msg);
            database.rollback(sp);
        }
        return p;
        
    }
}