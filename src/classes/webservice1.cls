@restresource(urlmapping='/account create/')
global class webservice1 {
    @httppost
    global static string invoke(string name,string industry){
        string result;
        system.JSONGenerator js=json.createGenerator(true);
        try{
             account a=new account();
        a.Name=name;
        a.Industry=industry;
        insert a;
            js.writeStartObject();
        js.writeStringField('Status','SUCCESS');
        js.writeIdField('Account Id', a.Id);
        }
        catch(exception e){
            js.writeStringField('Status','Error');
            js.writeStringField('ERROR',e.getMessage());
        }
        js.writeEndObject();
        result=js.getAsString();
        return result;
       
    }

}