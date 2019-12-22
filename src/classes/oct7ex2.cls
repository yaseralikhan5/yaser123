public class oct7ex2 {
    public  map<string,list<contact>> mapcon {set;get;}
    public oct7ex2(){
        list<contact> con=[select id from contact];
        list<id> d=new list<id>();
        list<contact> con1=[select accountid from contact where id in :con];
        for(contact c1:con1){
            d.add(c1.accountid);
        }
        list<account> acc=[select name,(select lastname from contacts) from account where id in :d];
        mapcon=new map<string,list<contact>>();
        list<contact> con2;
        for(account a:acc){
            string name=null;
            con2=new list<contact>();
            for(contact c:a.contacts){
                name=a.name;
                con2.add(c);
            }
            mapcon.put(name, con2);
        }
    }
}