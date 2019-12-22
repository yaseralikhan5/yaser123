public class ChequeMiniproject5 {
    public list<invoice__c> invoices {set;get;}
    public decimal totalamount;
    public integer count;
    public static list<invoice__c> invoiceList {set;get;}
    public static list<id> invoiceList1 {set;get;}
    public map<string,decimal> advanceamount;
    public ChequeMiniproject5(){
         invoiceList1=new list<id>();
    }
    public void cheque(list<Cheque_Details__c> ch){
        totalamount=0;
        count=0;
        string companyname;
        advanceamount=new map<string,decimal>();
         invoices=[select name,Due_Amount__c,Invoice_Amount__c,Status__c,Company__r.name from invoice__c where status__c!='closed' order by createddate];
        invoiceList=new list<invoice__c>();
       list<payments__c> payments=new list<payments__c>();
        for(Cheque_Details__c c:ch){
            totalamount=c.Amount__c;
            companyname=c.company__r.name;
            if(invoices.size()<=0 && count==0){
                advanceamount.put(c.Company__r.name, totalamount);
                //break;
            }
            for(invoice__c i:invoices){
                count++;
                    if(totalamount>0 && totalamount>=i.Due_Amount__c && c.Company__c==i.Company__c){
                        totalamount=totalamount-i.Due_Amount__c;
                        i.Due_Amount__c=0;
                        i.Status__c='closed';
                        invoicelist.add(i);
                      payments__c p1=new payments__c();
                    	p1.Amount__c=c.Amount__c;
                        p1.Cheque_Number__c=c.Id;
                       p1.Invoice_Number__c=i.id;
                        p1.DueAmount__c=0;
                        p1.Status__c='closed';
                       payments.add(p1);
                        
                      
                        if(invoices.size()==count && totalamount>0){
                            advanceamount.put(i.Company__r.name, totalamount);
                            break;
                        }
                        
                    }
                else
                    if(totalamount>0 && totalamount<i.Due_Amount__c && c.Company__c==i.Company__c){
                        i.Due_Amount__c=i.Due_Amount__c-totalamount;
                        totalamount=0;
                        i.Status__c='pending';
                        invoicelist.add(i);
                         payments__c p2=new payments__c();
                    	p2.Amount__c=c.Amount__c;
                        p2.Cheque_Number__c=c.Id;
                       p2.Invoice_Number__c=i.id;
                        p2.DueAmount__c=i.Due_Amount__c;
                        p2.Status__c='pending';
                        payments.add(p2);
                       
                        break;
                    }
            }
            
           insert payments;
            //update invoicelist;
        }
        list<account> acc=[select id,name,Advance_Amount__c from account];
        list<account> acc1=new list<account>();
       
        
        for(account a:acc){
            if(advanceamount.get(a.name)!=null || advanceamount.get(a.name)!=0){
            a.Advance_Amount__c=advanceamount.get(a.name); 
          acc1.add(a);
               }
        }
        update acc1;
        
        for(invoice__c i1:invoiceList){
            invoicelist1.add(i1.Id);
        }
         populateEmail(invoicelist1);
       
    }
   
    @future(callout=true)
    public static void populateEmail( list<id> inlist){
        
        messaging.SingleEmailMessage email1=new messaging.SingleEmailMessage();
        string[] str=new string[]{'yaseralikhan8@gmail.com'};
            email1.setToAddresses(str);
        email1.setSubject('Invoices covered');
        email1.setPlainTextBody('The invoices attached are covered under the payment');
        abc4 abc=new abc4(inlist);
        blob b;
        for(id d:inlist){
                 pagereference p=page.ChequeMiniProject5;
        p.getParameters().put('id',(string)d);
             b=p.getcontentaspdf();
        }
        
   
        
       /* list<invoice__c> invoices=new list<invoice__c>();
        list<invoice__c> invoices1=[select id, name,Due_Amount__c,Invoice_Amount__c,Status__c,Company__r.name from invoice__c];
        for(invoice__c inn:invoices1){
            for(id d:inlist){
                if(d==inn.id){
                    invoices.add(inn);
                }
            }
        }
       string str1='the invoices that are updated are:';
       for(invoice__c invi:invoices){
            str1=str1+'invoice no:   '+string.valueOf(invi.Name);
        }
        blob b=blob.topdf(str1);*/
        //blob b=p.getContentAsPDF();
        messaging.EmailFileAttachment etf=new messaging.EmailFileAttachment();
        etf.setBody(b);
        etf.setFileName('Invoices covered');
        messaging.EmailFileAttachment[] flies=new messaging.EmailFileAttachment[]{etf};
         email1.setFileAttachments(flies);
        messaging.Email[] emails=new messaging.Email[]{email1};
         messaging.sendEmail(emails);
        
    }
}