public class JavascriptCheckboxSelectAll {
    public list<wrapperabc16> rap {set;get;}
   public list<account> acc {set;get;}
   public list<selectoption> opp {set;get;}
    public boolean f {set;get;}
    public list<string> s;
    public string selected {set;get;}
   // public boolean flag {set;get;}
    public JavascriptCheckboxSelectAll()
    {
        
        opp=new list<selectoption>();
        rap=new list<wrapperabc16>();
        s=new list<string>{'none','Energy','Banking'};
            for(string ss:s)
        {
            selectoption o=new selectoption(ss,ss);
            opp.add(o);
        }
        
        acc=[select name,industry,phone,id from account];
       
        for(account a2:acc)
        {
            wrapperabc16 w=new wrapperabc16();
            w.accounts=a2;
            w.flag=false;
            rap.add(w);
           
}

    }
          
            public void change()
        {
            if(f==true){
                for(wrapperabc16 w:rap){
                    
                    w.flag=false;
                    w.flag=true;
                }
                
            }
            else
            {
                  for(wrapperabc16 w:rap){
                    w.flag=true;
                    w.flag=false;
                    
                }
                
            }
}
    public void create()
    {
        list<account> acc2;
        list<id> d1=new list<id>();
        for(wrapperabc16 w1:rap)
        {
            if(w1.flag==true)
            {
                d1.add(w1.accounts.id);
                w1.accounts.industry=selected;
            }
        }   
        acc2=[select name,id from account];
        for(account a3:acc2)
        {
            a3.industry=selected;
        }
        update acc2;
}
}