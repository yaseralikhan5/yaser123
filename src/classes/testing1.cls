public class testing1 {
    public list<account> acc1 {set;get;}
    
    public testing1(){
     
    
        acc1=[select id,name,industry,rating from account];
           
    }
    public void invoke(){
         account a1=new account(name='naveed');
        account a2=new account(name='yaser');
        list<account> acc=new list<account>{a1,a2};
            database.SaveResult[] result=database.insert(acc,true);
        for(database.SaveResult sr:result){
            if(sr.issuccess()){
                system.debug('is successful');
            }
            else{
                for(database.Error err:sr.geterrors()){
                    system.debug('the following error has occured'+ err.getstatuscode());
            }
                
                }
        }
    }
      
        }