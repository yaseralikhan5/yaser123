public class example1 {
@AuraEnabled
    public static list<Account> setaccs(){
        list<Account> acc =[select Id,Name,Industry,Rating,Phone from Account];
        return acc;
    }
    @AuraEnabled
    public static list<Account> createaccs(Account acc){
        insert acc;
        list<Account> accounts =[select Id,Name,Industry,Rating,Phone from Account];
        return accounts;
    }
}