public class ex1 {
@AuraEnabled
    public static list<account> invoke(string str){
        string search='%'+str+'%';
        list<account> acc=[select id,name,industry,rating from account where name like :search or industry like :search];
        return acc;
    }
    @AuraEnabled
    public static list<account> invoke2(){
        list<account>acc=[select id,name,industry,rating from account];
        return acc;
    }
}