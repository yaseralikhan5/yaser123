trigger triggerpractise4 on Lead (before insert) {
for(lead l:trigger.new)
{
    if(l.phone!=null)
    {
        l.leadscore__c=10;
    }
    
        if(l.email!=null)
    {
        l.leadscore__c=l.leadscore__c+10;
    }
    if(l.annualrevenue!=null)
    {
        l.leadscore__c=l.leadscore__c+20;
    }
    if(l.industry!=null)
    {
        l.leadscore__c=l.leadscore__c+20;
    }
}
}