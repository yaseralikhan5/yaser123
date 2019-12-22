public class SchemaObjectfieldCondition {
    public map<string,SObjectType> objtype {set;get;}
    public map<string,schema.sobjectfield> objfield {set;get;}
    PUblic SchemaObjectfieldCondition(){
        objtype=schema.getGlobalDescribe();
        set<string> obj=objtype.keyset();
        set<string> str=new set<string>();
        for(string p:obj){
            if(p.endswith('__c')){
                str.add(p);
            }
        }
        system.debug(str);
        //object selected=account;
    
       // schema.DescribeSObjectResult result=selected.sobjecttype.getdescribe();
       // objfield=result.fields.getmap();
        //system.debug(objfield);
    }
    }