public class jsonex3 {
    public string accesskey {set;get;}
    public string search {set;get;}
    //public list<selectoption> currency1 {set;get;}
    public string result {set;get;}
    public list<string> linkstring {set;get;}
    public jsonex3(){
       
    }
    public void invoke(){
        linkstring=new list<string>();
        httprequest request=new httprequest();
        string str='https://www.googleapis.com/youtube/v3/search?part=snippet&q='+search+'&key=AIzaSyDn__OXdUwUG1_ghuf5UX0TQEt1rhv3OwQ';
  		request.setMethod('GET');
        request.setEndpoint(str);
        http p=new http();
        httpresponse response=p.send(request);
        result=response.getBody();
        system.JSONParser js=json.createParser(result);
        while(js.nextToken()!=null){
            if(js.getText()=='videoId')
            {
                js.nextToken();
                if(js.getText()!=null){
                string st='http://www.youtube.com/watch?v='+js.getText();
                linkstring.add(st);
                }
            }
        }
    }
}