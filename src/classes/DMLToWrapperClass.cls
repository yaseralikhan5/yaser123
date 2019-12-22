public class DMLToWrapperClass {
    public list<accountdata_wrapper> rap {set;get;}
    public DMLToWrapperClass()
    {
        rap=new list<accountdata_wrapper>();
        list<account> acc=[select name,industry from account offset 5];
        for(account b:acc)
        {
            accountdata_wrapper wrap=new accountdata_wrapper();
            wrap.a=b;
            rap.add(wrap);
            
        }
    }
    
    
   

}