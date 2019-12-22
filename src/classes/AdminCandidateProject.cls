public class AdminCandidateProject {
   
    public Candidate_Enquiry__c c {set;get;}
   
    public AdminCandidateProject(apexpages.StandardController controller){

        list<string> fields=new list<string>{'Address_for_Correspondence__c', 'Age__c',
'Candidate_Name__c', 'Community__c', 'Course__c', 'Date_Of_Birth__c', 'Educational_Qualification__c',
'Email__c', 'Family_Annual_Income__c', 'Father_s_Mobile_No__c',
'Father_Occupation__c', 'Gender__c', 'Guardian__c', 'Guardian_Name__c', 'Interested_Course1__c', 'Interested_Course2__c',
'Mobile_No__c', 'Mother_Occupation__c', 'Other_Interested_Course__c', 'Passed_out_Organization__c',
'Passport_No__c', 'Permanent_Address__c', 'Proof_Submitted__c', 'Year_of_Passing__c'};
    controller.addFields(fields);
        c=(candidate_enquiry__c)controller.getRecord();
    }
 
   
    public pagereference sendinvoke()
    {
        //pagereference p;
      //  system.debug(ApexPages.currentPage().getParameters().get('ID'));
      
        /* c =[select id, Address_for_Correspondence__c, Age__c,
Candidate_Name__c, Community__c, Course__c, Date_Of_Birth__c, Educational_Qualification__c,
Email__c, Family_Annual_Income__c, Father_s_Mobile_No__c,
Father_Occupation__c, Gender__c, Guardian__c, Guardian_Name__c, Interested_Course1__c, Interested_Course2__c,
Mobile_No__c, Mother_Occupation__c, Other_Interested_Course__c, Passed_out_Organization__c,
Passport_No__c, Permanent_Address__c, Proof_Submitted__c, Year_of_Passing__c from Candidate_Enquiry__c where id=:ce.id];
        */
List<Student__c> stu=new List<Student__c>();
Student__c s;

s = new Student__c(Name=c.Candidate_Name__c, Address_For_Correspondence__c=c.Address_for_Correspondence__c,
Community__c=c.Community__c, Course__c=c.Course__c, Date_Of_Birth__c=c.Date_Of_Birth__c,
Educational_Qualification__c=c.Educational_Qualification__c, Email__c=c.Email__c,
Family_Annual_Income__c=c.Family_Annual_Income__c, Father_s_Mobile_No__c=c.Father_s_Mobile_No__c,
Father_Occupation__c=c.Father_Occupation__c, Gender__c=c.Gender__c, Guardian__c=c.Guardian__c,
Guardian_Name__c=c.Guardian_Name__c, Interested_Course_1__c=c.Interested_Course1__c,
Permanent_Address__c=c.Permanent_Address__c, Year_of_Pass__c=c.Year_of_Passing__c,
Passport_No__c=c.Passport_No__c, Proof_Submitted__c=c.Proof_Submitted__c,
Interested_Course_2__c=c.Interested_Course2__c, Other_Interested_Course__c=c.Other_Interested_Course__c,
Mobile_No__c=c.Mobile_No__c, Mother_Occupation__c=c.Mother_Occupation__c, Passed_Out_Organization__c=c.Passed_out_Organization__c );
stu.add(s);
database.insert(stu);
    
delete c;
          pagereference p=new pagereference('/'+s.id);
        return p;
    
}
      

}
    
   /* public pagereference stuDelete()
    {
        list<candidate_enquiry__c> can1=[select id from candidate_enquiry__c where id=:selected];
        delete can1;
        pagereference p=new pagereference('/'+selected);
        return p;
}*/