public class umair implements schedulable {
    public void execute(schedulablecontext sc){
        account acc=new account();
        acc.name='umair';
        acc.rating='Hot';
            insert acc;
    }
}