public class AccountTestApexClass {
    public void insert1(string name,string industry,string rating){
        account a=new account();
        a.name=name;
        a.Industry=industry;
        a.rating=rating;
        insert a;
    }
    public void update1(){
        list<account> acc=[select id,rating from account];
        for(account a1:acc){
            a1.rating='cold';
        }
        update acc;
        }
    public void delete1(){
        list<account> acc1=[select id from account where createddate=today];
        delete acc1;
    }
    }