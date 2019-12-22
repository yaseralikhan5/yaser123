public class trigger5Account {
    public static void submit(map<id,account> oldmap, map<id,account> newmap){
          list<account> accounts=new list<account>();
        for(id a:oldmap.keySet())
        {
          
            account a1=oldmap.get(a);
            account a2=newmap.get(a);
            if(a1.Industry!='banking' && a2.Industry=='banking')
            {
                //account acc1=new account();
                accounts.add(a2);
            }
        }
        approvalprocess(accounts);
          // share(accounts);
    }
    public static void approvalprocess(list<account> acc){
        list<id> userid1=new list<id>();
        for(account aa:acc)
        {
            userid1.add(aa.OwnerId);
            
        }
        list<user> userid2=[select id,Managerid from user where id in :userid1];
        map<id,id> ownermap=new map<id,id>();
        for(user ud:userid2)
        {
            ownermap.put(ud.Id,ud.ManagerId);
            
        }
       
        for(account a3:acc)
        {
             approval.ProcessSubmitRequest request=new approval.ProcessSubmitRequest();
        request.setObjectId(a3.Id);
        request.setProcessDefinitionNameOrId('accountApproval2');
       // request.setSkipEntryCriteria(false);
        user u=[select id from user where name='ghori khan'];
        request.setSubmitterId(a3.OwnerId);
        group g=[select id from group where name='private_test1'];
           
        id[] approval1=new id[]{ownermap.get(a3.OwnerId)};
        request.setNextApproverIds(approval1);
        approval.ProcessResult result=approval.process(request);
            
        }
       
    }
    public static void share(list<account> acc){
        list<accountshare> sha=new list<accountshare>();
        for(account a5:acc)
        {
            accountshare sh=new accountshare();
            sh.AccountId=a5.Id;
            sh.AccountAccessLevel='Read';
            sh.RowCause='Manual';
            sh.OpportunityAccessLevel='Read';
            group g=[select id from group where name='private_test1'];
            sh.UserOrGroupId=g.Id;
            sha.add(sh);
        }
        insert sha;
        
    }

     public static void delete1(list<account> acc){
         list<id> accountid1=new list<id>();
         list<id> accountid2=new list<id>();
         for(account a7:acc)
         {
             if(a7.rating=='Hot')
             {
                 accountid1.add(a7.Id);
                 
             }
             else
                 if(a7.Rating=='Cold')
             {
                 accountid2.add(a7.Id);
             }
         }
         list<contact> con2=[select id from contact where accountid in :accountid1];
         list<opportunity> opp=[select id from opportunity where accountid in :accountid2];
         delete con2;
         delete opp;
}
    
    //this program is use to implement database.result...nothing to do with the current program
    public static void test()
    {
        account a1=new account(name='result test1');
        account a2=new account();
        list<account>acc=new list<account>{a1,a2};
		database.SaveResult[] result=database.insert(acc, false);
        for(database.SaveResult sr:result)
        {
            if(sr.isSuccess())
            {
                system.debug('sucessfully inserted '+sr.getId());
            }
            else
            {
                for(database.Error err : sr.geterrors())
                {
                    system.debug(err.getStatusCode()+'  '+err.getMessage());
                    system.debug('account field'+ err.getFields());
                }
            }
        }
    }
        //below program is to fetch and use hierarchy custom list on other trigger....nothing to do with this program
        public static void hierarchyList()
        {
        Map<string,LObject__c> map1=LObject__c.getall();
        list<string> s =new list<string>();
        for(string s2:map1.keyset())
        {
            s.add(s2);
        }
        list<LObject__c> L=new list<LObject__c>();
        for(string s1:s)
        {
            LObject__c l1=new LObject__C();
            l1= map1.get(s1);
            L.add(l1);
           
        }
        for(LObject__c o:L)
        {
            system.debug(O.Name__c);
            system.debug(o.Quantity__c);
            system.debug(o.price__c);
        }
            
      
    }
}