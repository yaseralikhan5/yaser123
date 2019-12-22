public class ApprovalSubmission {
    public void invoke(list<lab__c> accounts){
        //list<lab__c> accounts=(list<Lab__c>)json.deserialize(acc, list<Lab__c>.class);
        for(lab__c lab:accounts){
            
        approval.ProcessSubmitRequest request1=new approval.ProcessSubmitRequest();
        user u=[select id from user where alias='naveed'];
        request1.setObjectId(lab.Id);
        list<id> userid=new list<id>();
        userid.add(u.id);
        request1.setProcessDefinitionNameOrId('labapproval1');
        request1.setNextApproverIds(userid);
        approval.ProcessResult result=approval.process(request1);
            
        }
    }
}