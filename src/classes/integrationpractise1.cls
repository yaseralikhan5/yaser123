public class integrationpractise1 {
    public string clientId {set;get;}
    public string clientSecret {set;get;}
    public integer username {set;get;}
    public string password {set;get;}
    public integer result {set;get;}
 
    public map<string,object> resmap {set;get;}
    public void invoke(){
        resmap=new map<string,object>();
        httprequest request=new httprequest();
        request.setMethod('POST');
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        String body='grant_type=password&client_id=3MVG9G9pzCUSkzZtBpoMzY1S21yhWy8fPeCZjZvvB7621BfD27KDEJ5zYsKgbXX4s8d_NrDsoYcY8y1eg0nb_';
       body=body+'&client_secret=C5BDB2CA1A869634F782550DB6BA801534468A1DA9E1B54C4AA751CC8F8C59EA';
       body=body+'&username=yaser@123.com';
       body=body+'&password=sarwari123';
        request.setBody(body);
        http p=new http();
        httpresponse response=p.send(request);
        
        result=response.getStatusCode();
        system.debug(result);
        }
    }