public class SelectOptionWithDML {
    public list<selectoption> sel {set;get;}
    public string selected {set;get;}
    public list<string> S {set;get;}
    public boolean flag {set;get;}
    public list<account> acc {set;get;}
    public list<contact> con {set;get;}
    public account a {set;get;}
    public SelectOptionWithDML()
    {
        sel=new list<selectoption>();
        acc=new list<account>();
        con=new list<contact>();
        a=new account();
        S=new list<string>{'none','account','opportunity','contact'};
           // flag=true;
        for(string st:S)
        {
            selectoption o=new selectoption(st,st);
            
            sel.add(o);
        }
    }
    public void fetch()
    {
    }
    public void insert1()
    {
        if(selected=='account')
        {
           // acc.clear();
               acc=[select name,industry,phone from account];
              
            insert a;
        }
                   
        
    }
    public void delete1()
    {
        if(selected=='account')
        {
            //acc.clear();
                acc=[select name,industry,phone from account where name=:a.name and industry=:a.industry];
        }
        delete a;
    }
 public void update1()
    {
        if(selected=='account')
        {
          list<account> identifier=[select id from account where name=:a.Name];
            for(account ac:identifier)
            {
                ac.Industry=a.Industry;
            }
            
               update identifier;
        }
        
    }

}