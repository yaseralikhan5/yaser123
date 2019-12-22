trigger oct23ex1 on Contact (after insert,before update) {
map<id,list<contact>> mapcon=new map<id,list<contact>>();
    string str='';
    integer i=null;
    list<id> ids=new list<id>();
    for(contact con:trigger.new){
        ids.add(con.accountid); 
    }
    list<account> acc=[select id,name,industry,(select lastname from contacts) from account where id in :ids];
    for(account a:acc){
        
        for(contact c:a.contacts){
            str=str+c.lastname;
        }
        a.name=str;
        update a;
    }
}