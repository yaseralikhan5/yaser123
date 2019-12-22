public class RecordViewDataTable {
@AuraEnabled
    public static list<account> populate(string str){
        string data='%'+str+'%';
        list<account> acc=[select id,name,industry,rating from account where name like :data or industry like :data];
        return acc;
    }
}