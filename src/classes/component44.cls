public class component44 {
    public list<string> accfields {set;get;}
    public list<string> confields {set;get;}
    public list<account> acc {set;get;}
    public list<contact> con {set;get;}
    public component44(){
        accfields=new list<string>{'name','industry','rating'};
        confields=new list<string>{'firstname','lastname','phone'};
        acc=[select name,industry,rating from account];
        con=[select firstname,lastname,phone from contact];
        
    }
}