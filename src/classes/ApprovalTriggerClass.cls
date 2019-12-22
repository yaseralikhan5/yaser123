public class ApprovalTriggerClass {

    public void approval(list<account> acc){
        for(account a:acc){
            approval.ProcessSubmitRequest request=new approval.ProcessSubmitRequest();
            request.setObjectId(a.Id);
            request.setSubmitterId(a.OwnerId);
            request.setProcessDefinitionNameOrId('Manager');
            approval.ProcessResult result=approval.process(request);
            if(result.getInstanceStatus()=='Approved'){
                messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
                string[] mail=new string[]{userinfo.getUserEmail()};
                msg.setToAddresses(mail);
                msg.setSubject('Approval request with account name :'+ a.Name +' has been submitted' );
                msg.setPlainTextBody('Submitted');
                messaging.Email[] emails=new messaging.Email[]{msg};
                    messaging.sendEmail(emails);
            }
        }
        
    }
}