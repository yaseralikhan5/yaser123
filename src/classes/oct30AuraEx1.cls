public class oct30AuraEx1 {
@AuraEnabled
    public static list<string> invoke(string fieldname){
        list<string> Fvalues=new list<string>();
        schema.SObjectType type1=Account.getsobjecttype();
        schema.DescribeSObjectResult result=type1.getdescribe();
        map<string,schema.SObjectField> fields=result.fields.getmap();
        list<schema.PicklistEntry> pe=fields.get(fieldname).getdescribe().getpicklistvalues();
        for(schema.PicklistEntry p:pe){
            Fvalues.add(p.getvalue());
        }
        return Fvalues;
    }
}