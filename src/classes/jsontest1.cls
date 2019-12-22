public class jsontest1 {
    public string jsonstring {set;get;}
    public  jsontest1(){
       list<account> acc=[select id,name from account];
        system.JSONGenerator js=json.createGenerator(true);
        js.writeStartObject();
        js.writeFieldName('customer');
        js.writeStartArray();
        for(account a:acc){
            js.writeStartObject();
            js.writeFieldName('name');
            js.writeString(a.name);
            js.writeEndObject();
        }
        js.writeEndArray();
        js.writeEndObject();
        jsonstring=js.getAsString();
        
    }
}