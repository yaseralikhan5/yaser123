public class list_example1
{
    public List<rapper_example1> rap{get;set;}
 
    public list_example1()
    {
        rap=new list<rapper_example1>();
        create();
       
    }
    public void create()
    {
        rapper_example1 r=new rapper_example1();
        rap.add(r);
    }
   
}