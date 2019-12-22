public class Apex_Example_2 {
	@AuraEnabled
    public static String callMe(String name,Integer age,Decimal salary){
        String result='Your Name : '+name+'==> Age :'+age+'===> Salary:'+salary;
        return result;
    }
}