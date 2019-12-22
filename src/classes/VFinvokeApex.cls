public class VFinvokeApex {
@AuraEnabled
    public static list<account> populate(string accName){
        string str='%'+accName+'%';
        list<account> acc=[select id,name,industry,rating from account where name like :str or industry like :str];
        return acc;
    } 
}