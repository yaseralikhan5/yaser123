public class ExtensionSetControllerOpportunity {
    public list<opportunity> opt {set;get;}
    public ExtensionSetControllerOpportunity(apexpages.StandardSetController controller){
        list<string> fields=new list<string>{'stagename'};
            controller.addFields(fields);
        opt=(list<opportunity>)controller.getSelected();
    }
    public pagereference invoke(){
        list<opportunity> opty=new list<opportunity>();
        for(opportunity p:opt){
            p.stagename='closed won';
            
        }
        update opt;
        pagereference p=new pagereference('/006');
        return p;
    }

}