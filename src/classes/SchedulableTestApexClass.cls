public class SchedulableTestApexClass implements schedulable {
    public void execute(system.SchedulableContext sc){
        list<opportunity> opp=[select id,stagename from opportunity];
        for(opportunity p:opp){
            p.stagename='prospecting';
        }
        update opp;
    }
}