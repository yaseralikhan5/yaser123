@istest
public class testwebservice3 {
@istest
    public static void call()
    {
        testwebservice2 web1=new testwebservice2();
        web1.invoke();
        testwebservice1 web2=new testwebservice1();
        test.setmock(HttpCalloutMock.class,web2);
        
        account acc=[select id,name,industry from account];
        system.assertEquals('dummy data', acc.name);
        system.assertEquals('banking',acc.Industry);
    }
}