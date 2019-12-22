public class jsonpractise {
    	 public String jsonString  {set;get;}
    public String searchText  {set;get;}
    public void jsonpractise(){
        List<Account> accounts =[select id,Name,phone from Account];
         System.JSONGenerator js =JSON.createGenerator(true);
        js.writeStartObject();
        if(accounts.size()>0){
            js.writeStringField('Status','Success');
            js.writeNumberField('Count',accounts.size());
            js.writeFieldName('Customers');
            js.writeStartArray();
            for(Account a: accounts){
                js.writeStartObject();
                js.writeStringField('Name',a.name);
                js.writeStringField('Phone',a.phone);
                js.writeEndObject();
            }
            js.writeEndArray();
        }else{
            js.writeStringField('Status','Failed');
        }
        js.writeEndObject();
        jsonString =js.getAsString();
        
    }
}
            /*
      	list<account> acc=[select id,name,industry from account where name like '%yaser%'];
        system.JSONGenerator js=json.createGenerator(true);
        js.writeStartObject();
       		if(acc.size()>0)
            {
            js.writeStringField('Status','Success');
            js.writeNumberField('count', acc.size());
            js.writeFieldName('customers');
            js.writeStartArray();
        	for(account a:acc)
            {
            js.writeStartObject();
            js.writeStringField('name',a.name);
            js.writeStringField('industry', a.industry);
            js.writeEndObject();
        	}
                
        js.writeEndArray();
                }
        js.writeEndObject();
        jsonstring=js.getAsString();
           
        }  
    } */