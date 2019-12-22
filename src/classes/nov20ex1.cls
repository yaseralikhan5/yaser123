public class nov20ex1 {
    public list<wrap> acc1 {set;get;}
    public nov20ex1(){
        acc1=new list<wrap>();
    }
    public void invoke(){
        wrap a=new wrap();
        a.acc=[select id,name,industry,rating from account];
        acc1.add(a);
        
    }
    public class wrap{
        public list<account> acc {set;get;}
        public wrap(){
            acc=new list<account>();
        }
    }
}