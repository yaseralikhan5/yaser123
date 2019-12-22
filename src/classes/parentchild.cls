public class parentchild {
@AuraEnabled
    public static string invokeaccount(string name,string industry,string rating){
        account a=new account();
        a.Name=name;
        a.Industry=industry;
        a.Rating=rating;
        insert a;
        return a.id;
        
    }
    @AuraEnabled
    public static void invokeContact(string lname,string fname,id accid){
        contact c=new contact();
        c.LastName=lname;
        c.FirstName=fname;
        c.AccountId=accid;
        insert c;
    }
}