@istest
public class testclass1 {
@isTest
    public static void update11()
    {
        class1data.update3();
        class1test t=new class1test();
        t.update1();
        
        account acc3=[select industry,phone from account];
        
        system.assertEquals('banking', acc3.Industry);
        system.assertEquals('1234', acc3.Phone);
    }
}