@RestResource(urlmapping='/accountCreate/*')
global class serviceresponse1 {
  @HttpPost
    global static String callMe(String accName,String accIndustry){
        String result;
        System.JSONGenerator js =JSON.createGenerator(true);
        js.writeStartObject();
        try{
          Account acc =new Account();
          acc.Name =accName;
          acc.Industry=accIndustry;
          insert acc;
            js.writeStringField('Status','Success');
            js.writeIdField('AccountId',acc.Id);
            
        }catch(Exception e){
            js.writeStringField('Status','Error');
            js.writeStringField('Error',e.getMessage());
        }
        js.writeEndObject();
        result =js.getAsString();
        return result;
        
    }
    @HttpGet
    global static String invoke(){
        RestRequest request =RestContext.request;
        RestResponse response =RestContext.response;
        Map<String,String> paramMap =request.params;
        String name =paramMap.get('accName');
        String phone=paramMap.get('accPhone');
        String industry=paramMap.get('industry');
        System.JSONGenerator js =JSON.createGenerator(true);
        js.writeStartObject();
        try{
          Account acc =new Account();
          acc.Name =name;
          acc.Industry=industry;
            acc.Phone=phone;
          insert acc;
            js.writeStringField('Status','Success');
            js.writeIdField('AccountId',acc.Id);
            
        }catch(Exception e){
            js.writeStringField('Status','Error');
            js.writeStringField('Error',e.getMessage());
        }
        js.writeEndObject();
        String result =js.getAsString();
        return result;
        
    }
}