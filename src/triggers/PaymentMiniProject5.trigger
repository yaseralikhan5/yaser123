trigger PaymentMiniProject5 on Payments__c (after insert) {
    if(trigger.isafter && trigger.isinsert){
        list<invoice__c> invo=new list<invoice__c>();
        list<invoice__c> inv=[select id,name,due_amount__c,invoice_amount__c,status__c from invoice__c];
        for(payments__c p:trigger.new){
            for(invoice__c invoices:inv){
                if(p.Invoice_Number__c==invoices.id){
                    invoices.Due_Amount__c=p.DueAmount__c;
                    invoices.Status__c=p.Status__c;
                    invo.add(invoices);
                }
            }
        }
        update invo;
    }
}