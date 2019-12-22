public class miniproject1 {
    public apexpages.StandardSetController controller {set;get;}
    public integer totalpages {set;get;}
    public integer total;
    public integer count {set;get;}
    public string search1 {set;get;}
    public string selected1 {set;get;}
    public list<account> accounts;
    public list<account> acc {set;get;}
    list<miniprojectwrapper> wrap {set;get;}
   public set<miniprojectwrapper> wrap1 {set;get;}
    
    public list<selectoption> op {set;get;}
public list<miniprojectwrapper> getwrap(){
  
    if(count==1){
    for(miniprojectwrapper w2:wrap){
        if(w2.flag==true){
            wrap1.add(w2);
        }
    }
        }
    if(selected1!='none'){
         for(miniprojectwrapper w1:wrap1){
            if(w1.flag==true){
                w1.a.industry=selected1;
    }
         }
                     
    }
  
    wrap=new list<miniprojectwrapper>();
    
       
       count=1;
         for(account ac:acc){
            miniprojectwrapper w=new miniprojectwrapper();
            w.a=ac;         
           w.flag=false;
            wrap.add(w);
         }
    if(wrap1.size()>0){
                 for(miniprojectwrapper w4:wrap1){
                     for(miniprojectwrapper w5:wrap)
                     if(w5.a.name==w4.a.name){
                         w5.flag=true;
                         w5.a.Industry=w4.a.Industry;
                         
                     }
                 }
             }

    return wrap;
        
    }
    public void populate1(){
        controller.save();
        acc=controller.getrecords();
             update acc;
        
    }
     public void select1()
    {
           string str='%'+search1+'%';       
         accounts=[select id,name,rating,industry from account where name like :str or industry like :str or rating like :str];
        
        invoke();
    }
   
    public  miniproject1()
    {
         wrap1=new set<miniprojectwrapper>();  
    
        op=new list<selectoption>();
        selectoption p=new selectoption('none','none');
        op.add(p);
        schema.DescribeFieldResult result=account.industry.getdescribe();
        list<schema.PicklistEntry> pe=result.getpicklistvalues();
        for(schema.PicklistEntry e:pe){
            selectoption p1=new selectoption(e.getLabel(),e.getValue());
            op.add(p1);
        }
              accounts=[select id,name,rating,industry from account];
        invoke();
    }
    public void invoke(){
        controller=new apexpages.standardsetcontroller(accounts);
        controller.setPageSize(5);
        total=controller.getResultSize();
        integer val=math.mod(total, 5);
        if(val>0){
            totalpages=(total/5)+1;
        }
        else{
            totalpages=(total/5);
        } 
          acc=controller.getrecords();
    count=0;
         }
    public void hasnext()
    {
        controller.save();
        integer pagenumber1=controller.getPageNumber();
        if(controller.getHasNext()){
           controller.setPageNumber(pageNumber1+1);
           acc=controller.getrecords();
        }
    }
    public void hasprevious()
    {
        controller.save();
        integer pagenumber1=controller.getPageNumber();
        if(controller.getHasPrevious()){
           controller.setPageNumber(pageNumber1-1);
           acc=controller.getrecords();
        }
    }
     public void hasfirst()
    {
        controller.save();
        integer pagenumber1=controller.getPageNumber();
        if(controller.getHasPrevious()){
           controller.setPageNumber(1);
           acc=controller.getrecords();
        }
    }
    public void haslast()
    {
        controller.save();
        integer pagenumber1=controller.getPageNumber();
        if(controller.getHasNext()){
           controller.setPageNumber(totalpages);
           acc=controller.getrecords();
        }
    }
    public void populate(){
        if(selected1!=null){
         for(miniprojectwrapper w1:wrap){
        if(w1.flag==true){
            for(account a:acc){
                    if(a.id==w1.a.id){
                a.industry=selected1;
            }
           }
        
    }
             controller.save();
        acc=controller.getrecords();
             update acc;
             }
        }
        }
}