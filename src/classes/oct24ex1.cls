public class oct24ex1 {
@AuraEnabled
    public static list<string> invoke(sobject name1,string fieldname){
        list<string> str=new list<string>();
     schema.SObjectType type1=name1.getsobjecttype();
        schema.DescribeSObjectResult result=type1.getdescribe();
        map<string,schema.SObjectField> fields=result.fields.getmap();
        list<schema.PicklistEntry> pe=fields.get(fieldname).getdescribe().getpicklistvalues();
        for(schema.PicklistEntry p:pe){
            str.add(p.getvalue());
        }
        return str;
    }
}