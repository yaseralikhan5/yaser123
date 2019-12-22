public class WrapperWithRenderedExample {
    
    public list<accountdata_wrapper> rap {set;get;}
    public WrapperWithRenderedExample()
    {
        rap=new list<accountdata_wrapper>();
        create();
    }
    public void create()
    {
        accountdata_wrapper wrap=new accountdata_wrapper();
        rap.add(wrap);
    }
    

}