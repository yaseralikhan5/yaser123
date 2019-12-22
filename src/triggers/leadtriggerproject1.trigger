trigger leadtriggerproject1 on Lead (after insert,after update) {

    if(trigger.isafter && trigger.isinsert){
        string recordtypename;
        user u=[select id,managerid from user where id=:userinfo.getUserId()];
        for(lead l:trigger.new){
            recordtypename = Schema.SObjectType.Lead.getRecordTypeInfosById().get(l.recordtypeid).getname();
            if(recordtypename=='Corporate'){
                approval.ProcessSubmitRequest request=new approval.ProcessSubmitRequest();
                request.setSubmitterId(u.id);
                request.setObjectId(l.id);
                string[] approval1=new string[]{u.ManagerId};
                request.setNextApproverIds(approval1);
                request.setProcessDefinitionNameOrId('Recordtype1');
                approval.ProcessResult result=approval.process(request);
                

            }
        }
    }
    if(trigger.isafter && trigger.isupdate){
         LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        for(lead l:trigger.new){
            if(l.approvalStatus__c=='Approved'){
              /*  database.LeadConvert lc=new database.LeadConvert();
                lc.setLeadId(l.Id);
                lc.setOpportunityName(l.Name);
               
                lc.setConvertedStatus(convertStatus.MasterLabel);   
                database.LeadConvertResult lcr=database.convertLead(lc);*/
                account a=new account();
                
                a.Name=l.FirstName;
                insert a;
                contact c=new contact();
                c.AccountId=a.Id;
                c.FirstName=l.FirstName;
                c.LastName=l.LastName;
                insert c;
                
            }
        }
    }
}