public class OpportunityTestApexClass {
    public void opp1(){
      list<opportunity> op=[select id, stagename from opportunity];
          for(opportunity p:op){
              p.stagename='prospecting';
          }
        update op;
    }
    public void opp2(){
        list<opportunity> op1=[select id, ownerid from opportunity where createddate=today];
        user u=[select id from user where name='ghori khan'];
        for(opportunity p:op1){
            p.ownerid=u.Id;
        }
        update op1;
    }
}