@isTest
public class TestForOpportunityTestApexClass {
@isTest
    static void call1(){
        OpportunityTestApexClass opc=new OpportunityTestApexClass();
        
        opportunity p=new opportunity();
        p.stagename='closed won';
        p.Name='yaser';
        p.CloseDate=system.today();
        insert p;
        opc.opp1();
        list<opportunity> opp=[select id ,stagename from opportunity];
        for(opportunity p1:opp){
            system.assertEquals('prospecting', p1.stagename);
        }
    }
    @isTest
    static void call2(){
        OpportunityTestApexClass opc=new OpportunityTestApexClass();
         opportunity p=new opportunity();
        p.stagename='closed won';
        p.Name='yaser';
        p.CloseDate=system.today();
        insert p;
        opc.opp2();
         list<opportunity> op1=[select id, ownerid from opportunity];
        user u=[select id from user where name='ghori khan'];
        for(opportunity p1:op1){
            system.assertEquals(u.id, p1.OwnerId);
    }
}
}