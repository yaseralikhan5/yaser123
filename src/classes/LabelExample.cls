public class LabelExample
{
    public string result{get;set;}
    public void show()
    {
        result='show method is called';
    }
    public PageReference mypage()
    {
        PageReference p=new PageReference('/apex/apex_page0');
        return p;
    
    }
}