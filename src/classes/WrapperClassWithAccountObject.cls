public class WrapperClassWithAccountObject
{
    public list<accountdata_wrapper> rap {set;get;}
    //public list<account> acc {set;get;}
     public WrapperClassWithAccountObject()
     { 
         rap=new list<accountdata_wrapper>();
        list<account> acc=[select name,industry,description from account];
         list<id> i=new list<id>();
    for(account ac:acc)
      {
          accountdata_wrapper wrap=new accountdata_wrapper();
          wrap.a=ac;
          
          rap.add(wrap);
           i.add(wrap.a.id);
      }
         list<contact> con=[select firstname,lastname from contact where accountid in :i];
        for(contact cc:con)
        {
            accountdata_wrapper wrap=new accountdata_wrapper();
            wrap.c=cc;
            rap.add(wrap);
            
        }
     }
}