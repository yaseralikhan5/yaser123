public class QueueableOnOpportunity implements queueable {

    public void execute(queueablecontext q){
        list<opportunity> opp=[select id,stagename from opportunity];
        for(opportunity p:opp)
        {
            p.stagename='closed won';
        }
        update opp;
    }
}