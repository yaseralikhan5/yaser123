trigger triggerpractise2 on Contact (before insert) {
   for(contact con:trigger.new)
   {
       if(con.accountid==null)
       {
           con.AccountId.adderror('Please add account parent from lookup');
       }
   }

}