@restresource(urlmapping ='/createacc/*')
global class oct7ex4 {
@httppost
    global static string invoke(string name,string industry){
        string str;
        try{
             account a=new account();
        a.Name=name;
        a.Industry=industry;
        insert a;
            str='success';
        }
            catch(exception e){
                str='failure';
            }
       
        return str;
    }
}