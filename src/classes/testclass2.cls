@isTest
public class testclass2 {
    @isTest
public static void callme()
{
    class2test t=new class2test();
    t.create('yaser','banking');
    integer count=[select count() from account where name='yaser' and industry='banking'];
    system.assertEquals(1, count);
    t.invoke('yaser123','finance');
     integer count1=[select count() from account where name='yaser123' and industry='finance'];
    system.assertEquals(1, count1);
}
}