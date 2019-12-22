///this code is to open custom form from any where on the web....like web to lead

public class webtocustom {
    public blacklist__c bcc {set;get;}
    public string name {set;get;}
    public string pancard {set;get;}
    public string phone {set;get;}
    public webtocustom(){
        bcc=new blacklist__c ();
    }
    public pagereference submit(){
        
        bcc.Name=name;
        bcc.Pancard__c=pancard;
        bcc.phone__c=phone;
        insert bcc;
        pagereference p=new pagereference('/'+bcc.Id);
        return p;
    }
}