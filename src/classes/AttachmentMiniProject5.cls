public class AttachmentMiniProject5 {
    public list<invoice__c> inv {set;get;}
    public AttachmentMiniProject5(){}
    public  AttachmentMiniProject5(list<invoice__c> invoices){
        inv=invoices;
    }
}