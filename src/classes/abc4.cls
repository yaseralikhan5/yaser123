public class abc4
{
    public list<invoice__c> invoices {set;get;}
    
    public abc4()
    {
        
    }
    public abc4(list<id> inlist){
        invoices=new list<invoice__c>();
        list<invoice__c> invoices1=[select id, name,Due_Amount__c,Invoice_Amount__c,Status__c,Company__r.name from invoice__c];
        for(invoice__c inn:invoices1){
            for(id d:inlist){
                if(d==inn.id){
                    invoices.add(inn);
                }
            }
        }
    }    
    
}