public class AccountIndustryFieldPopulate {
    public list<selectoption> opt {set;get;}
    public list<wrapperdemo> list1 {set;get;}
    public AccountIndustryFieldPopulate(){
        list1=new list<wrapperdemo>();
        opt=new list<selectoption>();
        schema.DescribeFieldResult result=account.industry.getdescribe();
        if(result.getType()==schema.DisplayType.PICKLIST){
            list<schema.PicklistEntry> list1=result.getpicklistvalues();
            for(schema.PicklistEntry e:list1){
                selectoption op=new selectoption(e.getvalue(),e.getlabel());
                opt.add(op);
            }
        }
        invoke();
    }
    public void invoke(){
        wrapperdemo w=new wrapperdemo();
        list1.add(w);
    }

}