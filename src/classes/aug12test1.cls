public class aug12test1  {
    public string search {set;get;}
    public list<wrapcontact> wrap {set;get;}
    public list<contact> con {set;get;}
    public void invoke1(){
        wrap=new list<wrapcontact>();
        list<contact>con1=[select id,firstname,lastname,email,phone from contact where firstname=:search];
        for(contact con2:con1){
            wrapcontact w=new wrapcontact();
            w.wrapcon=con2;
            w.flag=false;
            wrap.add(w);
        }
       
        }
    public void invoke2(){
        con=new list<contact>();
        for(wrapcontact con4:wrap){
            if(con4.flag==true){
                con.add(con4.wrapcon);
            }
        }
    }
    
    public class wrapcontact
    {
        public contact wrapcon{set;get;}
        public boolean flag {set;get;}
    }
  }