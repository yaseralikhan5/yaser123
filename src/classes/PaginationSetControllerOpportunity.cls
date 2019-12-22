public class PaginationSetControllerOpportunity {
    public integer total {set;get;}
    public integer totalpages {set;get;}
    public apexpages.StandardSetController controller {set;get;}
    public list<opportunity> getopt(){
        
        list<opportunity> opt=(list<opportunity>)controller.getrecords();
        return opt;
    }
    public PaginationSetControllerOpportunity(){
        list<opportunity> op=[select id,name,stagename,closedate from opportunity];
        controller=new apexpages.StandardSetController(op);
       controller.setPageSize(5);
        total=controller.getResultSize();
        integer val=math.mod(total, 5);
        if(val>0){
            totalpages=(total/5)+1;
        }
        else
        {
            totalpages=(total/5);
        }
    }

}