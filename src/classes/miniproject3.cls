public class miniproject3 {
    public string entered {set;get;}
    public account acc {set;get;}
    public contact cc {set;get;}
    public list<account> acc1 {set;get;}
    public map<id,string> entrymap1;
    public map<id,decimal> entrymap2;
    public list<miniproject3Wrapper> wrap {set;get;}
    public miniproject3()
    {
        cc=new contact();
       acc=new account();
        acc.name='gene';
        entrymap1=new map<id,string>();
        entrymap2=new map<id,decimal>();
        wrap=new list<miniproject3Wrapper>();
        populate1();
        populate2();
    }
    public void populate1(){
       
      if(acc.name!=null){
        entered='%'+acc.name+'%';
               
       acc1=[select id,name,industry,billingcity,description,(select id,lastname,
      firstname,mobilephone,otherphone,email,department from contacts limit 1) from account  where name like :entered limit 1];
      
            if(acc1[0].contacts[0]!=null && acc1[0]!=null){
                acc=acc1[0];
        cc=acc1[0].contacts[0];
             }
        }  
    }
    public void populate2(){
         list<pricebookentry> pbe=[select id,product2id,name,unitprice from pricebookentry limit 7];
            for(pricebookentry pe2:pbe){
                
                miniproject3Wrapper wr=new miniproject3Wrapper();
                wr.name=pe2.Name;
                wr.unitprice=pe2.UnitPrice;
                wr.product2id=pe2.Product2Id;
                wr.pricebookentryid=pe2.Id;
                wrap.add(wr);
            }
    
    }
    public void submit(){
        list<opportunitylineitem> olist= new list<opportunitylineitem>();
        opportunity opp=new opportunity();
            opp.Name=acc1[0].Name;
            opp.CloseDate=system.today()+10;
            opp.StageName='prospecting';
            opp.AccountId=acc.Id;
            opp.ContactId=cc.Id;
            insert opp;
       
        for(miniproject3Wrapper w1:wrap){
            opportunitylineitem oli=new opportunitylineitem();
            oli.OpportunityId=opp.Id;
          	oli.Product2Id=w1.product2id;
            oli.PricebookEntryId=w1.pricebookentryid;
            oli.UnitPrice=w1.unitprice;
            oli.Quantity=w1.quantity;
            //oli.TotalPrice=w1.total;
            olist.add(oli);
        }
        insert olist;
        
    }
}