/*
 * clientid=1qf70arkaesgt9534asa74jgcssg2xju
 * clientsecret=0rV2xBSgeY2rH78ne5RtjrWuFSljGdP4
 */
public class boxApex1 {
    public string clientid {set;get;}
    public string clientsecret {set;get;}
    public string code {set;get;}
    public string accesstoken {set;get;}
    public string redirect {set;get;}
    public string body {set;get;}
    
    public void boxApex1(){
        
    }
    public pagereference invoke(){
        
        redirect='https://yaseralikhan-dev-ed.my.salesforce.com/apex/box2';
        string url='https://account.box.com/api/oauth2/authorize?response_type=code&client_id='+clientid;
        url=url+'&redirect_uri='+redirect;
        url=url+'&state=Yaser';
        pagereference p=new pagereference(url);
        return p;
    }
    public void invoke1(){
        code=Apexpages.currentPage().getParameters().get('code');
    }
    public void invoke2(){
        httprequest request=new httprequest();
        request.setMethod('POST');
        request.setEndpoint('https://api.box.com/oauth2/token');
        
        string body1='grant_type=authorization_code';
        body1=body1+'&code='+code;
        body1=body1+'&client_id='+clientid;
        body1=body1+'&client_secret='+clientsecret;
        request.setBody(body1);
        http p1=new http();
        httpresponse response=p1.send(request);
        body=response.getBody();
        system.JSONParser js=json.createParser(body);
        while(js.nextToken()!=null){
            if(js.getText()=='access_token'){
                js.nextToken();
                accesstoken=js.getText();
            }
        }
    }
}