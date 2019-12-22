public class MultiCodePage{
    public MultiCodePage()
    {
        product2 p2=new product2();
        p2.Name='samsung';
       p2.IsActive=true;
       insert p2;
        
        pricebook2 pb2=new pricebook2();
        pb2.Name='samsung price';
        pb2.IsActive=true;
        insert pb2;
        
        list<pricebook2> S1=[select id from pricebook2 where name='samsung price'];
        pricebook2 pg;
        for(pricebook2 g:S1)
        {
            pg=new pricebook2();
            pg.Id=g.Id;
        }
        list<product2> S2=[select id from product2 where name='samsung'];
        product2 pg2;
        for(product2 g1:S2)
        {
            pg2=new product2();
            pg2.Id=g1.Id;
        }
        
        pricebookentry pbe=new pricebookentry();
        pbe.Product2Id=pg.Id;
        pbe.Pricebook2Id=pg2.Id;
        pbe.IsActive=true;
        pbe.UnitPrice=1000;
        pbe.UseStandardPrice=false;
        insert pbe;
        
     user u=[select id from user where name='yaser ali khan'];  
    list<customer_bank__c> cus=[select id,firstname__c from customer_bank__c where Ownerid=:u.Id];
        list<task> tk=new list<task>();
      for(customer_bank__c c:cus)
      {
          task t=new task();
          if(c.firstname__c=='yaser')
          {
              t.WhatId=c.Id;
              t.OwnerId=userinfo.getUserId();
              t.ActivityDate=system.today();
              t.Subject='Customer task testing';
              t.Priority='High';
              tk.add(t);
          }
              
      }
        insert tk;
        
      
list<account> acc=[select name,industry,id,(select firstname,lastname from contacts) from account];
        
       for(account a:acc)
       {
           if(a.name=='yaser')
           {
               for(contact con:a.contacts)
               {
                   con.FirstName='bahubali';
               }
           }

       }update acc;
       
        profile p=[select id from profile where name='Student'];
        list<user> u1=[select id from user where profileid=:p.Id];
        userrole r=[select id from userrole where name='CEO'];
        list<user> update1=new list<user>();
        for(user u2:u1)
        {
            u2.UserRoleId=r.Id;
            update1.add(u2);
            
        }
        update update1;
        
        user u3=[select id from user where name='ghori khan'];
        list<lead> led=[select ownerid,leadsource from lead where leadsource='Web' limit 2];
        list<lead> l1=new list<lead>();
        for(lead l:led)
        {
            l.OwnerId=u3.Id;
            l1.add(l);
        }
        update l1;
        
queuesobject q=new queuesobject();
        userrole r1=[select id from userrole where name='CEO'];
        q.SobjectType='Lead';
        q.QueueId=r1.Id;
       
        insert q;
        list<lead> led1=[select id from lead where leadsource='Email'];
        list<lead> led2=new list<lead>();
        for(lead l3:led1)
        {
            l3.OwnerId=q.QueueId;
            led2.add(l3);
        }
        update led2;
        
        
        
    }
}