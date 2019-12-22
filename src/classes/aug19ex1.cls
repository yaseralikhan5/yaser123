public class aug19ex1 {
    
    @AuraEnabled
    public static list<account> invoke1(){
        list<account> acc1=[select id,name,industry,rating from account];
        return acc1;
    }
    
    @AuraEnabled
    public static list<account> populate(account acc){
        insert acc;
        list<account> accounts=[select id,name,industry,rating from account];
        return accounts;
    }
    public pagereference action1(){
        pagereference p=new pagereference('/apex/aug19ex3?name=yaser');
        return p;
    }
}