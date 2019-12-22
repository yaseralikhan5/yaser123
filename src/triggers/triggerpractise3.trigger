trigger triggerpractise3 on application__c (before insert) {
    list<application__c> app=trigger.new;
list<blacklist__c> b=[select pancard__c,id,name from blacklist__c];
    list<blacklist__c> b2=new list<blacklist__c>();
    boolean flag=false;
    for(application__c p:app)
    {
        for(blacklist__c bb:b)
        {
            if (p.pancard__c==bb.pancard__c)
            {
                blacklist__c b1=new blacklist__c();
                b1.Id=bb.Id;
                b1.phone__c=p.phone__c;                
                b2.add(b1);
               //flag=true;
               p.adderror('Entered pancard number is blacklisted');
            }
        }
        database.update(b2, false);
       
    }
  
    

}