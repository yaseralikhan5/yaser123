@istest
public class TestForLabApproval {
@istest
    public static void approval1(){
        course__c c1=new course__c(course_name__c='YOGA');
        insert c1;
        student__c st=new student__c(Name='yaser',guardian_name__c='yasin',course__c=c1.id,mobile_no__c='9088780',permanent_Address__c='golconda');
        insert st;
        lab__c l=new lab__c();
    
        l.Attendance__c='Present';
        l.Faculty_Name__c='yaser';
        l.Student_Id__c=st.Id;
        insert l;
        system.debug(l.id);
        user u=[select id from user where alias='naveed'];
        integer lb=[select count() from lab__c];
        system.assertEquals(lb, 1);
         List<ProcessInstance> processInstances = [select Id, Status from ProcessInstance where TargetObjectId = :u.Id];
         System.assertEquals(processInstances.size(),1);
       
        
    }
}