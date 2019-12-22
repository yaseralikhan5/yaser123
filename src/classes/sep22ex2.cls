public class sep22ex2 {
    public list<account> acc {set;get;}
    public string name1 {set;get;}
    public sep22ex2(){
        acc=new list<account>();
        for(integer i=0;i<3;i++){
             account a=new account();
            acc.add(a);
        }
    }
}