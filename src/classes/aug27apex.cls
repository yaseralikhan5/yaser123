public class aug27apex {
    @AuraEnabled
    public static list<account> invoke1(string str){
        string search1='%'+str+'%';
           
       list<account> acc=[select id,name,industry,rating from account where name like :search1 or industry like :search1];
        return acc;
          }
    @AuraEnabled
    public static list<account> populate(account acc1){
       insert acc1;
        list<account> accounts=[select id,name,industry,rating from account];
        return accounts;
    }
}