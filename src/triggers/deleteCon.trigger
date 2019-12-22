trigger deleteCon on Contact (before delete) {
    if(trigger.isbefore && trigger.isdelete){
        list<id> ids=new list<id>();
        for(contact con:trigger.old){
            ids.add(con.accountid);
        }  
        list<account> accounts=new list<account>();
        list<account> acc=[select id,name,industry from account where id in :ids];
        for(account a:acc){
            a.industry='Banking';
            accounts.add(a);
        }
        update accounts;
    }
}