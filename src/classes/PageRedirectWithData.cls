public class PageRedirectWithData {
    public account accounts {set;get;}
   // public wrapperabc16 wrap {set;get;}
    public string name {set;get;}
    public string age {set;get;}
    public string result {set;get;}
    public PageRedirectWithData(){
        //wrap=new wrapperabc16();
        accounts=new account();
    }
    public void invoke(){
        result=name+age;
    }
    public pagereference next(){
        
        pagereference p=new pagereference('/apex/abc24');
        return p;
    }
public pagereference previous(){
      
        pagereference p=new pagereference('/apex/abc23');
        return p;
    }
    public pagereference finish(){
       
        pagereference p=new pagereference('/apex/abc25');
        return p;
    }
     public pagereference Home(){
       
        pagereference p=new pagereference('/apex/abc23');
         
        p.setRedirect(true);
         return p;
    }
     public pagereference Insert1(){
       
         insert accounts;
        pagereference p=new pagereference('/'+accounts.Id);
        return p;
    }
    
}