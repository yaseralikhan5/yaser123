/* EndPoint      : https://login.salesforce.com/services/oauth2/token
 * Method      : POST
 * Parameters    : grant_type,client_id,client_secret,username,password
 * Response      : JSON
 * Response Data  : access_token
 */
public class oct29RestApiEx1 {
    public String clientId     {set;get;}
    public String clientSecret   {set;get;}
    public String userName    {set;get;}
    public String password    {set;get;}
    public String accessToken  {set;get;}
    public String endpoint    {set;get;}
    public String result    {set;get;}
    public List<String> names   {set;get;}
    public string status {set;get;}
    public void requestToken(){
       // 1. Create a http instance 
       Http p=new Http();
       //2. Create HttpRequest 
       HttpRequest request =new HttpRequest();
       // set the endpont
       request.setEndpoint('https://login.salesforce.com/services/oauth2/token');
       // set method 
       request.setMethod('POST');
       //Create a body
       String body='grant_type=password&client_id='+clientId;
       body=body+'&client_secret='+clientSecret;
       body=body+'&username='+username;
       body=body+'&password='+password;
       request.setBody(body);
       HttpResponse response =p.send(request);
     result=response.getBody();
       System.debug(result);
       System.JSONParser jp=JSON.createParser(result);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken=jp.getText();
            }
        }
    }
    public void getData(){
        Http p=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndpoint('https://ap15.salesforce.com/services/data/v47.0/sobjects/Account');
        request.setMethod('POST');
        request.setHeader('Authorization','OAuth '+accessToken);
        //string str='{"Name":"Resttestingex1","Industry":"Banking"}';
            //'{ "attributes" : {"type" : "Account"},"name" : "RestTestingEx1","phone" : "1111111111","industry" : "Banking" }';
        request.setBody('{"Name":"Resttestingex1"}');
        HttpResponse response =p.send(request);
        String body=response.getBody();
        status=body;
        System.JSONParser jp=JSON.createParser(body);
        names =new List<String>();
        while(jp.nextToken()!=null)
            if(jp.getText()=='name'){
                jp.nextToken();
                names.add(jp.getText());
            }
        }
    }