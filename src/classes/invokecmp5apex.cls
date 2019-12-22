public class invokecmp5apex {
@AuraEnabled
    public static string invoke1(string name,string industry,string rating){
        account acc=new account();
        acc.Name=name;
        acc.Industry=industry;
        acc.Rating=rating;
        insert acc;
        string str;
        if(acc.id !=null || acc.id != ''){
            str='success';
        }
            else{
                str='failed';
            }
        return str;
    }
}