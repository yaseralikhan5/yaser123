public class excelaccount {
    public list<account> acc {set;get;}
    public excelaccount(){
        acc=[select id,name,industry from account];
    }
}