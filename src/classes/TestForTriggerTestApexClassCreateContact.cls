@isTest
public class TestForTriggerTestApexClassCreateContact {
@isTest
    static void call1(){
        account a=new account();
        a.Name='yaser test';
        insert a;
        contact c=[select id,firstname,lastname from contact];
        system.assertEquals(a.id, c.AccountId);
        system.assertEquals('yaser test', c.FirstName);
        system.assertEquals('yaser test', c.LastName);
    }
}