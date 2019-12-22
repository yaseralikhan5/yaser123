@isTest
public class testclassNov20ex1 {
@isTest static void invoke(){
        account a=new account();
        a.Name='YaserTest1';
        a.Industry='Banking';
        a.Rating='Hot';
        insert a;
    }
    @isTest
     static void invoke1(){
        invoke();
        nov20ex1 e=new nov20ex1();
        e.invoke();
        integer i=[select count() from account];
        system.assertEquals(1, i);
    }
}