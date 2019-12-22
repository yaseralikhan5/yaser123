public class futureClass1 {
    @future
public static void method1()
{
    system.debug('M11');
    system.debug('M12');
    system.debug('M13');
}
    @future
    public static void method2()
    {
        system.debug('M21');
         system.debug('M22');
         system.debug('M23');
    }
    public void show()
    {
        system.debug('M31');
        system.debug('M32');
        method1();
        system.debug('M33');
        method2();
        system.debug('M34');
    }
}