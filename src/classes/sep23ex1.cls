public class sep23ex1 {
    public list<account> acc {set;get;}
    public sep23ex1(apexpages.StandardSetController controller1){
        list<string> fields=new list<string>{'Name','Industry','Rating'};
            controller1.addFields(fields);
        acc=(list<Account>)controller1.getSelected();
    }
    public pagereference Invoke(){
        pagereference p=new pagereference('/apex/001');
        return p;
    }
    
    }