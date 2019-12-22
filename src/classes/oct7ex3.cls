@istest
public class oct7ex3 {
@istest
    public static void callme(){
        oct7ex2 d=new oct7ex2();
        test.setMock(httpcalloutmock.class, d);
        oct7ex1 d1=new oct7ex1();
        d1.invoke();
        account a=[select name from account];
        system.assertEquals('dummy',a.Name);
    }
}