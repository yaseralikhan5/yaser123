@isTest
public class TestForConditionTestApexClass {
  
    static testMethod void testMe(){
        ConditionTestApexClass four =new ConditionTestApexClass();
        four.industry='Energy';
        four.call();
        System.assertEquals('Hot',four.rating);
        System.assertEquals('New',four.status);
        four.industry='Education';
        four.call();
        System.assertEquals('Cold',four.rating);
        System.assertEquals('Existing',four.status);
    }
}
/*@isTest
public class TestForConditionTestApexClass {
@isTest
     static void testme(){
        ConditionTestApexClass c=new ConditionTestApexClass();
        c.industry='banking';
        c.call();
        system.assertEquals('hot',c.rating);
        system.assertEquals(1000,c.amount);
        c.industry='education';
        c.call();
        system.assertEquals('cold', c.rating);
        system.assertEquals(5000, c.amount);
    }
}*/