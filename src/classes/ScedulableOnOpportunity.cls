public class ScedulableOnOpportunity implements schedulable {
public void execute(schedulablecontext sc)
{
        opportunity p1=new opportunity();
        p1.StageName='closed lost';
        p1.CloseDate=system.today()+10;
        p1.name='vivo1';
    insert p1;
    
}
}