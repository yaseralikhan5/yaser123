public class SchemaAccountAttributeDisplay {
    public map<string,object>  obj {set;get;}
    public SchemaAccountAttributeDisplay(){
        obj=new map<string,object>();
        schema.DescribeSObjectResult result=account.sobjecttype.getdescribe();
        obj.put('label',result.getLabel());
        obj.put('name', result.getName());
        obj.put('key',result.getKeyPrefix());
        obj.put('Read',result.isAccessible());
    }
}