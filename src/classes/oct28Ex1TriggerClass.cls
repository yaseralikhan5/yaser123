public class oct28Ex1TriggerClass {
    public void invoke(string json1){
        list<account> acc=(list<account>)Json.deserialize(json1,list<account>.class);
         user u=[select id from user where alias='naveed'];
        for(account a:acc){
            if(a.industry=='banking'){
                approval.ProcessSubmitRequest request1=new approval.ProcessSubmitRequest();
             request1.setObjectId(a.id);
            request1.setComments(u.id);
            request1.setProcessDefinitionNameOrId('AccountApproval');
            approval.ProcessResult result=approval.process(request1);
           
            }
             
        }

    }
}