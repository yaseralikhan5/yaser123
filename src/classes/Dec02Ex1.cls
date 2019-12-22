public with sharing class Dec02Ex1 {
 
    Account myAccount;
    integer i =0;
    //Creates an account record.
    public PageReference createAccount() {
        //Create an account using DML operation.
        if(i<10){
            myAccount = new Account(name = 'yaser software company');
            insert myAccount;
            i++;
            return null;
        }  else {
            pageReference pg =page.Nov28ex1;
            pg.setRedirect(true);
            return pg;
        }
       
    }
    
    public PageReference updateAccount() {
       // Update the same account record  
        myAccount.Name = 'yaser1';
        update myAccount; 
        return null;
    }
    
}