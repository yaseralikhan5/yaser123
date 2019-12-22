@isTest
public class testclass3 {
@isTest
     static void callme()
    {
        class3test s=new class3test();
        s.insert1('yaser', 'banking');
        integer i=[select count() from account where name='yaser' and industry='banking'];
        system.assertEquals(1, i);
        
    }
    @isTest
     static void invokeme()
    {
        class1data.update3();
        class3test s1=new class3test();
        s1.update1();
        integer i1=[select count() from account where rating='Hot'];
        system.assertEquals(1, i1);
    }
    @isTest
     static void deleteme()
    {
        class1data.update3();
        class3test s2=new class3test();
        s2.del1();
         integer i2=[select count() from account];
        system.assertEquals(0, i2);
}
}