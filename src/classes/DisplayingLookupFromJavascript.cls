public class DisplayingLookupFromJavascript {
    public list<user> u {set;get;}
    public string user1 {set;get;}
    public string selected {set;get;}
    public DisplayingLookupFromJavascript(){
        u=[select id,name from user where isactive=true];
    }
    public void populate(){
        
        user1=selected;
        
    }
}