public class aug03event1 {
    @AuraEnabled
    public static string accountinsert(string name,string industry,string rating){
        account acc=new account();
        acc.Name=name;
        acc.Industry=industry;
        acc.Rating=rating;
        insert acc;
        return acc.id;
    }
    @AuraEnabled
    public static string contactinsert(string lname,string fname,string accid){
        contact con=new contact();
        con.FirstName=fname;
        con.LastName=lname;
        con.AccountId=accid;
        insert con;
        string str=con.id+'%';
        return str;
    }

}