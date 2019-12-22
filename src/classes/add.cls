public class add
{
    public string selected{set;get;}
    public add()
    { 
        selected='one';
}
    public void next()
    {
        selected='two';
    }
    public void previous()
    {
        selected='one';
    }
    
}