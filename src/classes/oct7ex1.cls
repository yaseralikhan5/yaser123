public class oct7ex1 {
    public string clientid {set;get;}
    public string clientsecret {set;get;}
    public string callback {set;get;}
    public string code {set;get;}
    public string token {set;get;}
    public oct7ex1(){
        callback='https://yaseralikhan-dev-ed.my.salesforce.com/apex/oct7ex4';
    }
    public pagereference codesubmit(){
        string url='https://login.salesforce.com/services/oauth2/authorize?response_type=code&';
        url=url+'client_id='+clientid;
		url=url+'&redirect_uri='+callback;
        return new pagereference(url);
    }
}