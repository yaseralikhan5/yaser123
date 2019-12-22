public class oct15ex1 {
@auraenabled
    public static list<account> invoke1(string name){
        string str='%'+name+'%';
        list<account> acc=[select name,industry,rating from account where name like :str];
        return acc;
    }
}