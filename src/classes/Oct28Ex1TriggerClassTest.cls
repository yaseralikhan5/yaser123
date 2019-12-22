@istest
public class Oct28Ex1TriggerClassTest {
    @testSetup
    public static void insertMethod(){
        account a=new account();
        a.Name='testing';
        a.industry='Banking';
        a.Rating='Hot';
        insert a;
       
    }
@istest
    public static void invoke(){
        insertmethod();
        account a=[select id,name,industry,rating from account];
        system.assertEquals('Banking', a.Industry);
        string str=json.serialize(a);
        oct28Ex1TriggerClass cl=new oct28Ex1TriggerClass();
        cl.invoke(str);
        
    }
}