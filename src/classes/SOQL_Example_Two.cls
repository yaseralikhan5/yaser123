public class SOQL_Example_Two {
	@AuraEnabled
    public static List<Account> getAccs(){
        List<Account> accounts =[select id,Name,Phone,Rating,Industry from Account];
        return accounts;
    }
    @AuraEnabled
    public static List<Account> createAcc(Account acc){
        String result;
        insert acc;
         List<Account> accounts =[select id,Name,Phone,Rating,Industry from Account];
        return accounts;
    }
}