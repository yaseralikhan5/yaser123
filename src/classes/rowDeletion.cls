public class rowDeletion {
    public list<account> acc {set;get;}
    public string myid1 {set;get;}
    public rowDeletion(){
        populate();
    }
    public void populate(){
        acc=[select id, name,industry,rating from account];
    }
    public void delist(){
       // string myid=system.currentPageReference().getParameters().get('Row Id');
        //string i=myid1.left(15);
           account acc1=[select id from account where id=:myid1];
           delete acc1;
       populate();
       
    }
}