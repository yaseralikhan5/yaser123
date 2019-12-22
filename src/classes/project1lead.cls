public class project1lead {

    public lead l {set;get;}
    public project1lead(apexpages.StandardController controller){
        l=(lead)controller.getRecord();
    }
    public pagereference submit(){
        insert l;
        pagereference p=new pagereference('/'+l.id);
        return p;
    }
}