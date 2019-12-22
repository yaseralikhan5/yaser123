public class DynamicQueryDML {
    public list<selectoption> field {set;get;}
    public list<account> acc {set;get;}
    public list<string> s {set;get;}
    public list<string> selected {set;get;}
    public DynamicQueryDML()
    {
        field=new list<selectoption>();
        selected=new list<string>();
       // acc=new list<account>();
        s=new list<string>{'name','industry','phone','description'};
            
            for(string ss:s)
        {
                selectoption o=new selectoption(ss,ss);                   
               field.add(o);
        }
    }
    public void fetch()
    {
        string st='select id';
      
        for(string i:selected)
        {
            st=st+ ','+i;
        } 
          st=st+' from account';
        acc=database.query(st);
       
    }
    

}