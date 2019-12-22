@isTest
public class TestForSchedulableTestApexClass {
@isTest
    static void call1(){
        opportunity op=new opportunity();
        op.StageName='prospecting';
        op.Name='yaser test';
        op.CloseDate=system.today();
        insert op;
        test.startTest();
        SchedulableTestApexClass c=new SchedulableTestApexClass();
        string exp='0 0 10 15 7 ?';
        id jobid=system.Schedule('abc',exp,c);
        test.stopTest();
        opportunity op1=[select id , stagename from opportunity];
        system.assertEquals('prospecting', op1.StageName);
        crontrigger cronid=[select id,cronexpression from crontrigger where id=:jobid];
        system.assertEquals(exp, cronid.cronexpression);
    }
}