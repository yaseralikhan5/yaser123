public class classpractise12 {
    public string name {set;get;}
    public string rating {set;get;}
        public string industry {set;get;}
        public string phone {set;get;}
        public string email {set;get;}
public string department {set;get;}
        public string Assistantname {set;get;}
    public string lastname {set;get;}
       
        public pagereference create()
    { 
        pagereference p;
        account a=new account();
     a.name=name;
     a.rating=rating;
     a.industry=industry;
     a.Phone=phone;
        insert a;
     contact c=new contact();
     c.email=email;
     c.department=department;
     c.AssistantName=Assistantname;
           c.LastName=lastname;
     c.AccountId=a.Id;
     
        insert c;
        p=new pagereference('/'+a.id);
     return p;
    }
     
}