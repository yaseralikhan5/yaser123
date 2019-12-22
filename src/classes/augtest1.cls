@isTest
public class augtest1 {
@isTest
     static void testmethod1(){
         list<contact> con1=new list<contact>();
             for(integer i=0;i<10;i++)
             {
             contact c=new contact();
                 c.FirstName='lastname'+i;
                 c.LastName='yaser';
                 con1.add(c);
         		}
         insert con1;
         aug12test1 obj=new aug12test1();
         obj.search='lastname'+'%';
         obj.invoke1();
         integer con=[select count() from contact where firstname like 'lastname%'];
         system.assertEquals(con, con1.size());
         
         for(aug12test1.wrapcontact cc:obj.wrap){
             if(!cc.flag){
                 cc.flag=true;
             }
             obj.invoke2();
         }
         
    }
}