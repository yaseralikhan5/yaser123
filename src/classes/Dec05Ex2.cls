/**
 * Created by yaser on 05-12-2019.
 */
@Invocablemethod
public with sharing class Dec05Ex2 {

    public Dec05Ex2(){
        account a=new account();
        a.Name='Invocable Method';
        insert a;
    }
}