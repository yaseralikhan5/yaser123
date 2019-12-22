public class KosmosAssignment {
    public list<string> currency1 {set;get;}
    public list<string> currency2 {set;get;}
    public string accesskey;
    public string result {set;get;}
    public string result1 {set;get;}
    public string source {set;get;}
    public list<string> field1 {set;get;}
    public list<selectoption> opt1 {set;get;}
    public list<selectoption> opt2 {set;get;}
    public string selected {set;get;}
    public decimal currencyValue {set;get;}
    public decimal value1 {set;get;}
    public decimal value2;
    public list<string> currencyOptions {set;get;}
    public KosmosAssignment(){
        accesskey='86c992d96d0ba3928c8b78d731bfb5e5';
        
        opt1=new list<selectoption>();
        currencyOptions=new list<string>();
        populate();
    }
    public void populate(){
         httprequest request=new httprequest();
        request.setEndpoint('http://data.fixer.io/api/latest?access_key='+accesskey);
        request.setMethod('POST');
        http p=new http();
        httpresponse response=p.send(request);
        result1=response.getBody();
        
        system.JSONParser js1=json.createParser(result1);
        
         integer count=0;
         while(js1.nexttoken()!=null){
          if(js1.gettext()=='rates'){
          js1.nexttoken();
          for(integer i=0;i<=count;i++){
            js1.nexttoken();
              if(js1.getText()!='}'){
                  currencyOptions.add(js1.getText());
              }
              if(js1.nexttoken()!=null && js1.getText()!='}'){
            count++;
        }
      }
   }
}
        system.debug(currencyOptions);
      
        for(string s:currencyOptions){
            selectoption op=new selectoption(s,s);
            opt1.add(op);
        }
        
        opt2=new list<selectoption>();
        opt2.add(new selectoption('EUR','EUR'));
    }
    public void invoke(){
        try{
            httprequest request=new httprequest();
        request.setEndpoint('http://data.fixer.io/api/latest?access_key='+accesskey+'&symbols='+selected);
        request.setMethod('POST');
        http p=new http();
        httpresponse response=p.send(request);
        result=response.getBody();
        
        system.JSONParser js=json.createParser(result);
       
       
        while(js.nextToken()!=null){
            if(js.getText()==selected){
                    js.nextToken();  
                    value2=js.getDecimalValue();
                break;
                }               
            }
       currencyValue=value2*value1;
      
        }
        catch(exception e){
            apexpages.Message msg=new apexpages.Message(apexpages.Severity.ERROR,'There is an Issue with the page');
            apexpages.addMessage(msg);
        }
        
    }
}