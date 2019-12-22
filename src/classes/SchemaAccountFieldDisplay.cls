public class SchemaAccountFieldDisplay {
    public map<string,schema.sobjectfield> obj {set;get;}
    public SchemaAccountFieldDisplay(){
        schema.DescribeSObjectResult result=account.sobjecttype.getdescribe();
        obj=result.fields.getmap();
    }

}