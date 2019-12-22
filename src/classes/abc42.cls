public class abc42 {
    public list<account> acc {set;get;}
    public list<contact> con {set;get;}
    public abc42(){
        list<list<sobject>> obj=[find 'yaser' in all fields returning account(name,industry,rating),contact(firstname,lastname,phone)];
        acc=(list<account>)obj[0];
        con=(list<contact>)obj[1];
    }
}