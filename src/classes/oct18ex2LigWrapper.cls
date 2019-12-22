public class oct18ex2LigWrapper {
@AuraEnabled
    public static wrapperClass invoke(){
        wrapperClass cls=new wrapperClass();
        cls.con=[select firstname, lastname from contact limit 10];
        cls.intcon=cls.con.size();
        cls.conmsg='This is a contact message';
        return cls;
    } 
    public class wrapperClass{
        @AuraEnabled public  list<contact> con {set;get;}
        @AuraEnabled public  integer intcon {set;get;}
        @AuraEnabled public  string conmsg {set;get;}
    }}