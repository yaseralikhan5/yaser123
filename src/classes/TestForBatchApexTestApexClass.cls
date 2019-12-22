@isTest
public class TestForBatchApexTestApexClass {
@isTest
    static void call1(){
        opportunity p=new opportunity();
        p.stagename='closed won';
        p.name='yaser test';
        p.CloseDate=system.today()+12;
        insert p;
        
        test.startTest();
        BatchApexTestApexClass b=new BatchApexTestApexClass();
        id jobid=database.executeBatch(b, 7);
        
        test.stopTest();
        opportunity op=[select id ,stagename,closedate from opportunity];
        system.assertEquals('prospecting', op.stagename);
        system.assertEquals(system.today(), op.closedate);
        
	
    }
}