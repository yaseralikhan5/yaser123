public class gmailIntegration {
    public string clientid {set;get;}
    public string clientSecret {set;get;}
    public string redirectURL;
    public string codeUrl;
    public string code;
    public string SCOPE;
    public string state;
    public string APPROVAL_PROMPT;
    public gmailintegration(){
        SCOPE='https://www.google.com/m8/feeds https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile';
		state='/profile';
        APPROVAL_PROMPT='force';
        redirectURL='https://yaseralikhan-dev-ed--c.visualforce.com/apex/gmail2?core.apexpages.request.devconsole=1';
    }
    
    public pagereference codeurl(){
       
        codeUrl='https://accounts.google.com/o/oauth2/auth?';
        codeurl=codeurl+'scope='+SCOPE;
		codeurl=codeurl+'&state='+STATE;
         codeUrl=codeUrl+'&redirect_uri='+redirectUrl;
        codeUrl=codeUrl+'&response_type=code&client_id='+clientid;
       // codeUrl=codeUrl+'&client_secret='+clientSecret;
        codeurl=codeurl+'&approval_prompt='+APPROVAL_PROMPT;
       
       
        pagereference p=new pagereference(codeURL);
        return p;
    }
       public void readCode(){
        code =Apexpages.currentPage().getParameters().get('code');
    }
}