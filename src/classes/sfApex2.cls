public class sfApex2 {
    public string username {set;get;}
    public string pwd {set;get;}
    public string clientid {set;get;}
    public string clientsecret {set;get;}
    public string accesstoken {set;get;}
    public string token {set;get;}
    public string content {set;get;}
    public void invoke(){
        httprequest request = new httprequest();
        request.setMethod('POST');
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        string body='grant_type=password';
        body=body+'&client_id='+clientid+'&client_secret='+clientsecret;
        body=body+'&username='+username+'&password='+pwd;
        request.setbody(body);
        http p=new http();
        httpresponse response=p.send(request);
        accesstoken=response.getBody();
        system.JSONParser js=json.createParser(accesstoken);
        while(js.nextToken()!=null){
            if(js.getText()=='access_token'){
                js.nextToken();
                token=js.getText();
            }
        }
    }
    public void invoke1(){
        httprequest request=new httprequest();
        string str='0012v00002YY3Qe';
       request.setEndpoint('https://ap15.salesforce.com/services/data/v45.0/sobjects/Account');
        request.setMethod('POST');
        request.setHeader('Authorization','OAuth '+token);
        string str1='{"Name":"yaseroauthtest1","Industry":"Finance"}';
        request.setBody(str1);
        http p=new http();
        httpresponse response=p.send(request);
        content=response.getBody();
    }
}