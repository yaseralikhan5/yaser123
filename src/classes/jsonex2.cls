public class jsonex2 {
    public integer pin {set;get;}
    public list<string> cities {set;get;}
    public string result;
    public void places(){
        cities=new list<string>();
        httprequest request=new httprequest();
        request.setEndpoint('https://api.postalpincode.in/pincode/'+pin);
        request.setMethod('GET');
        http p=new http();
        httpresponse response=p.send(request);
        result=response.getBody();
        system.JSONParser js=json.createParser(result);
        while(js.nextToken()!=null){
            if(js.getText()=='Name'){
                js.nextToken();
                string str=js.getText();
                cities.add(str);
            }
        }
        
    }
}