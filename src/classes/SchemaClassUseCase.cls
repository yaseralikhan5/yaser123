public class SchemaClassUseCase {
    public string selected {set;get;}
    public map<string,schema.SObjectType> Objmap;
    public map<string,schema.SObjectField> fieldmap;
    public list<selectoption> seltype {set;get;}
    public string selected1 {set;get;}
     public list<selectoption> selobject {set;get;}
    public string selected2 {set;get;}
     public list<selectoption> selfield {set;get;}
    public list<string> selected3 {set;get;}
    public list<selectoption> MoveField {set;get;}
    public list<string> selected4 {set;get;}
    //public string selected5 {set;get;}
    //public string selected6 {set;get;}
    public set<string> obj1;
    public list<string> stdobj;
    public list<string>cusobj;
    public map<string,list<string>> objmap1;
    public list<wrapper41> wrap {set;get;}
    public list<selectoption> operation;
    public integer count;
    public list<sobject> obj4 {set;get;}
    public list<string> field2 {set;get;}
    public SchemaClassUseCase(){
      // obj4=new list<sobject>();
        count=0;
        wrap=new list<wrapper41>();
        selobject=new list<selectoption>();
        seltype=new list<selectoption>();
          selfield=new list<selectoption>();
        MoveField=new list<selectoption>();
        stdobj=new list<string>();
        cusobj=new list<string>();
        operation=new list<selectoption>();
        operation.add(new selectoption('=','equals to'));
         operation.add(new selectoption('!=','not equals to'));
        objmap=schema.getGlobalDescribe();
         obj1=objmap.keyset();
        seltype=new list<selectoption>();
        seltype.add(new selectoption('none','none'));
        seltype.add(new selectoption('StandardObject','StandardObject'));
        seltype.add(new selectoption('CustomObject','CustomObject'));
         for(string s:obj1){
            if(!s.endswith('__c')){
            stdobj.add(s);    
            }
           else{
               cusobj.add(s);
           }
            }

           objmap1=new map<string,list<string>>();
        selectoption op1=new selectoption('none','none');
        selobject.add(op1);
        objmap1.put('StandardObject', stdobj);
        objmap1.put('CustomObject', cusobj);
             populate5();
      }
    
    public void populate1(){
      selobject.clear();
        selectoption op1=new selectoption('none','none');
        selobject.add(op1);
        if(selected1!='none'){
            list<string> str=objmap1.get(selected1);
       
        for(string s:str){
            selectoption op=new selectoption(s,s);
            selobject.add(op);
             }
        }
   }
    public void populate2(){
        selfield.clear();
        selectoption op=new selectoption('none','none');
        selfield.add(op);
Map<String, Schema.SObjectField> objectmap = objmap.get(selected2).getDescribe().fields.getMap();
        set<string> Lfields=objectmap.keyset();
        for(string s:Lfields){
            selectoption op1=new selectoption(s,s);
            selfield.add(op1);
        }
    }
    public void populate3(){
        
        for(string s:selected3){
         
            selectoption op=new selectoption(s,s);
            Movefield.add(op);
           integer a=selfield.indexOf(op);
            selfield.remove(a);
        } 
    }
    public void populate4(){
        for(string s:selected4){
            selectoption op=new selectoption(s,s);
            selfield.add(op);
            Movefield.remove(Movefield.indexOf(op));
        }
    }
    public void populate5(){
        count++;
        wrapper41 wp=new wrapper41();
        wp.fields=Movefield;
        wp.operation=operation;
        wrap.add(wp);
        
           }
    public void populate6(){
        wrap.remove(wrap.size()-1);
    }
    public void populate7(){
        field2=new list<string>();
        for(selectoption op:Movefield){
            field2.add(op.getValue());
        }
       
        string query='select id';
        for(string s:field2){
            query=query+' , '+s;
        }
        query=query+' from '+selected2+' where ';
       integer count=0;
           for(wrapper41 w:wrap){
              
                query=query+w.selected5+w.selected6+'\''+w.value+'\'';
                
               if(wrap.size()>0){
                    query=query+' '+w.conditionvalue+' ';
                   }
                    }
            
        obj4=database.query(query);
        }
    public void dummy(){}
    

public class wrapper41
{
    public list<selectoption> fields {set;get;}
    public list<selectoption> operation {set;get;}
    public string selected5 {set;get;}
    public string selected6 {set;get;}
    public string value {set;get;}
    public string conditionvalue {set;get;}
    public wrapper41(){
        fields=new list<selectoption>();
        operation=new list<selectoption>();
    }
}
}