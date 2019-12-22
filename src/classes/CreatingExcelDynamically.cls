public class CreatingExcelDynamically {
    public string GeneratedDate {set;get;}
    public list<account> acclist {set;get;}
    public string xmlheader {set;get;}
    public CreatingExcelDynamically(){
        //xmlheader='<?xml version="1.0"?><?mso-application progid="Excel.Sheet"?>';
        GeneratedDate=date.today().format();
    }
    public void GetExcelData(){
        acclist=[select Name,AccountNumber,ShippingStreet,ShippingCountry,shippingState,ShippingCity,ShippingPostalCode,
                BillingStreet,BillingCountry,BillingState,BillingCity,BillingPostalCode,AnnualRevenue from account where name='GenePoint'];
    }
}