@isTest
public class TestForAccountTestApexClass {
@isTest
    static void call1(){
        AccountTestApexClass ac=new AccountTestApexClass();
        ac.insert1('yaser','banking','hot');
        account a2=[select name,industry,rating from account];
        system.assertEquals('yaser', a2.Name);
        system.assertEquals('industry', a2.Industry);
        system.assertEquals('hot',a2.Rating);
    }
    @isTest
    static void call2(){
         AccountTestApexClass ac=new AccountTestApexClass();
        account a=new account();
        a.name='yaser test';
        a.Rating='hot';
        insert a;
        ac.update1();
        list<account> acc=[select id,rating from account];
        for(account a1:acc){
            system.assertEquals('cold',a1.rating);
        }
    }
    @isTest
    static void call3(){
        AccountTestApexClass ac=new AccountTestApexClass();
        ac.delete1();
        list<account> i=[select id from account where createddate=today];
        system.assertEquals(0, i.size());
    }
    
}