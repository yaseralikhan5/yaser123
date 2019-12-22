public class oct18ex1 {
@AuraEnabled
    public static map<string,list<sobject>> invoke(){
        map<string,list<sobject>> ligmap=new map<string,list<sobject>>();
        list<account> acc=[select name,industry from account limit 10];
        list<contact> con=[select firstname,lastname from contact limit 10];
        ligmap.put('Accrecord', acc);
        ligmap.put('Conrecord',con);
        return ligmap;
    }
}