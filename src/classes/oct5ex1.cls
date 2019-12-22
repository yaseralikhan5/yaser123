public class oct5ex1 {
    public string sum1 {set;get;}
    public string sum2 {set;get;}
    public string token1 {set;get;}
    public oct5ex1(){
        string str='callout:salesforce1/oauth2/token';
        string clientid='3MVG9G9pzCUSkzZtcHxB6zOwT_dJ1tsfpniUrhfnGUGaler7glsu3UcognuO9O8a8k7n9L83W.wz57SDoWnHf';
        string clientsecret='AD30268B46659D9AB384779F2FCBCF8BBA3D9321F8C531FB89385ED0E2E3A8BF';
        string user='yaseralikhan5@gmail.com';
        string password='yaser123';
        httprequest request=new httprequest();
        request.setMethod('POST');
        request.setEndpoint(str);
        request.setBody('grant_type=password&client_id='+clientid+'&client_secret='+clientsecret+'&username='+user+'&password='+password);
        http p=new http();
        httpresponse response=p.send(request);
        sum1=response.getBody();
        system.jsonparser js=json.createParser(sum1);
        while(js.nextToken()!=null){
            if(js.getText()=='access_token'){
                js.nextToken();
                token1=js.getText();
            }
        }
        httprequest request1=new httprequest();
        request1.setEndpoint('callout:salesforce1/data/v46.0/sobjects/account/');
        request1.setMethod('POST');
        request1.setHeader('Authorization','oauth '+token1);
        request1.setHeader('Content-Type','application/json');
        string accjson='{"Name":"GenePoint"}';
        request1.setBody(accjson);
        http p1=new http();
        httpresponse response1=p1.send(request1);
        sum2=response1.getBody();
        
    }
}