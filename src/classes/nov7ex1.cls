public class nov7ex1 {
    public void invoke1(){
        list<id> d=new list<id>();
        list<account> acc=[select id,name from account];
        for(account a:acc){
            d.add(a.id);
        }
        invoke2(d);
    }
    @future
    public static void invoke2(list<id> ids){
        system.debug(ids);
    }
}