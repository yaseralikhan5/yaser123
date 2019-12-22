public class inboundex1 {
    public list<wrapperinbound> wrap {set;get;}
    public integer GrandTotal {set;get;}
    public integer count {set;get;}
    public inboundex1(){
        //GrandTotal=0;
        count=0;
        wrap=new list<wrapperinbound>();
        call();
    }
    public void call(){
        for(integer i=0;i<4;i++){
              wrapperinbound w=new wrapperinbound();
            wrap.add(w);
        }   
    }
    public void populate(){
        count++;
        GrandTotal=GrandTotal+1000;
    }

}