public class jsontest2 {
  public string jsonstring;
    public string jsonstr;
    public jsontest2(){
        jsonstring='{"name":"yaser","age":"32","education":"btech"}';
        jsonstr='{"name":"yaser","cities":["hyd","sec","patna","ranchi"],"account":[{"name":"naveed","industry":"banking"},{"name":"khan","industry":"retail"}]}';
       
    }
    public void invoke(){
        list<account> accounts;
      system.JSONParser js=json.createParser(jsonStr);
        while(js.nextToken()!=null){
            if(js.getText()=='account'){
                js.nextToken();
                accounts=(list<account>)js.readValueAs(list<account>.class);
                
            }
        }
        system.debug(accounts);
    }
    public string getname(){
        string name;
         system.JSONParser js=json.createParser(jsonString);
        while(js.nextToken()!=null){
            if(js.getText()=='name'){
                js.nextToken();
               name=js.getText();
            }
        }
        return name;
    }
    public string getage(){
        string age;
         system.JSONParser js=json.createParser(jsonString);
        while(js.nextToken()!=null){
            if(js.getText()=='age'){
                js.nextToken();
                age=js.getText();
            }
        }
        return age;
    }
}