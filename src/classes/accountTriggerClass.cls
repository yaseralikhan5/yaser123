public class accountTriggerClass {
    public static void updateacc(list<account> acc)
    {
        list<account> acc1=new list<account>();
       
        for(account a:acc)
        {
            account a1=new account();
            a1.AnnualRevenue=10000;
            a1.id=a.Id;
            acc1.add(a1);
        }
        update acc1;
    }
    
    
    
    
    public static void Check(map<id,account> oldmap,map<id,account> newmap)
    {
        list<account> acc=new list<account>();
        for(id key:oldmap.keyset())
        {
            account a1=oldmap.get(key);
            account a2=newmap.get(key);
            if(a1.industry!='Finance' && a2.industry=='Finance')
            {
                acc.add(a2);
            }
        }
       updateacc(acc);
        approvalRule(acc);
        shareRule(acc);
        
    }
    public static void shareRule(list<account> acc)
    {
        list<accountshare> sh=new list<accountshare>();
        user u=[select id from user where name='ghori khan'];
        for(account a:acc)
        {
            accountshare ah=new accountshare();
            ah.AccountId=a.Id;
            ah.OpportunityAccessLevel='Read';
            ah.AccountAccessLevel='Read';
            ah.RowCause='Manual';
            ah.UserOrGroupId=u.id;
            sh.add(ah);
            
        }
        insert sh;
    }
public static void approvalRule(list<account> acc)
{
    for(account a:acc)
    {
        approval.ProcessSubmitRequest request=new approval.ProcessSubmitRequest();
        request.setProcessDefinitionNameOrId('accountApproval1');
        request.setObjectId(a.id);
        request.setSubmitterId(a.ownerid);
        approval.ProcessResult result=approval.process(request);
    }
} 
    ////this is to create a queue...nothing to do with this program
    public static void QueueGroup()
    {
        user u=[select id from user where name='naveed ali khan'];
        group g=new group(Name='test queue abc', type='queue');
        insert g;
        queueSobject s=new queueSobject(Sobjecttype='Lead',queueid=g.Id);
        insert s;
        groupmember member=new groupmember();
        member.UserOrGroupId=u.Id;
        member.GroupId=g.id;
        insert member;
        
    }
    
    ///this program is use to assign user to roles....no relation with the current program
    public static void Assigning_users_to_Roles()
    {
          profile p=[select id from profile where name='Student'];
        list<user> u1=[select id from user where profileid=:p.Id];
        userrole r=[select id from userrole where name='ITSales'];
        list<user> update1=new list<user>();
        for(user u2:u1)
        {
            u2.UserRoleId=r.Id;
            update1.add(u2);
            
        }
        update update1;

    }
   
}