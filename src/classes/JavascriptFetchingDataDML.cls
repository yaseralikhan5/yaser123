public class JavascriptFetchingDataDML {
    public string name {set;get;}
    public string age {set;get;}
    public string city {set;get;}
    public string result {set;get;}
    public string d {set;get;}
    public void invoke(){
        result=name+age+city;
    }
    public void invoke1(){
d='time:'+system.now();
    }

}