public class sep16test1 {
    public map<string,credentials__c> cred {set;get;}
    public list<credentials__c> c {set;get;}
    public sep16test1(){
        cred=credentials__c.getall();
         c=cred.values();
        
        
    }
}