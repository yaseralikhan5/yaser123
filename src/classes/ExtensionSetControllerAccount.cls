public class ExtensionSetControllerAccount {
    public list<account> acc {set;get;}
    public ExtensionSetControllerAccount(apexpages.StandardSetController controller){
        list<string> fields= new list<string>{'name','phone','industry','rating'};
            controller.addFields(fields);
        acc=(list<account>)controller.getSelected();
    }
    public pagereference invoke(){
        
        delete acc;
        pagereference p=new pagereference('/001');
        return p;
    }

}