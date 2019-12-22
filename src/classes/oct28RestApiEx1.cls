public class oct28RestApiEx1 {
    public string clientid {set;get;}
    public string clientsecret {set;get;}
    public string code {set;get;}
    public string token {set;get;}
    public string redirect {set;get;}
    public string body {set;get;}
    public string data1{set;get;}
    public oct28RestApiEx1(){
        redirect='https://yaseralikhan-dev-ed.my.salesforce.com/apex/ex2';
    }
    public pagereference invoke1(){
       string url='https://login.salesforce.com/services/oauth2/authorize?response_type=code';
        url=url+'&client_id='+clientid;
        url=url+'&redirect_uri='+redirect;
        pagereference p=new pagereference(url);
        return p;
    }
    public void invoke2(){
        code=apexpages.currentPage().getparameters().get('code');
    }
    public void invoke3(){
        httprequest request1=new httprequest();
        request1.setMethod('POST');
        request1.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        string endpoint='grant_type=authorization_code';
         endpoint=endpoint+'&code='+code;
        endpoint=endpoint+'&client_id='+clientid;
        endpoint=endpoint+'&client_secret='+clientsecret;
        endpoint=endpoint+'&redirect_uri='+redirect;
        request1.setBody(endpoint);
        http p=new http();
        httpresponse response1=p.send(request1);
        body=response1.getbody();
        system.JSONParser js=json.createParser(body);
        while(js.nextToken()!=null){
            if(js.getText()=='access_token'){
                js.nextToken();
                token=js.getText();
            }
        }
       
    }
    public void invoke4(){
        httprequest request2=new httprequest();
        request2.setMethod('GET');
        request2.setEndpoint('https://ap15.salesforce.com/services/data/v47.0/sobjects/account');
        request2.setHeader('Content-Type', 'application/json');
        request2.setHeader('Authorization', 'Bearer '+token);
        //string body1='{"Name":"RESTTesting1"}';
       // request.setBody(body1);
        http p=new http();
        httpresponse response2=p.send(request2);
        data1=response2.getBody();
    }
    
}