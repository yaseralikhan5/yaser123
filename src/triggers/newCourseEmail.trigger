trigger newCourseEmail on Course__c (after insert) {
    /*
list<string> email=new list<string>();
    list<candidate_enquiry__c> candidate=[select candidate_name__c,email__c from candidate_enquiry__c];
    list<messaging.SingleEmailMessage> singleMessage=new list<messaging.SingleEmailMessage>();
    for(candidate_enquiry__c c:candidate)
    {
        if(c.email__c!=null){
            email.add(c.Email__c);
        }
    }
    for(course__c co:trigger.new)
    {
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        msg.setToAddresses(email);
        msg.setSubject(co.Course_Name__c+' is starting');
        msg.setplaintextbody('Dear candidate,\r\n The following course is starting in our institute '+ co.Course_Name__c+'from \r\n starting date :'+co.Course_Starting_Date__c+
                         ' to \r\n closing date :'+ co.Course_Closing_Date__c+ '\r\n duration :'+co.Course_Duration__c+' \r\n Faculty :'+co.Faculty__c+'\r\n regards \r\n yaser ali khan');
    	singlemessage.add(msg);
    }
    if(singlemessage!=null && singlemessage.size()>0)
    {
        messaging.sendEmail(singlemessage);
    }
*/
}