public class testwebservice2 {
    public void invoke(){
        http p=new http();
        httprequest request=new httprequest();
        request.setMethod('POST');
        request.setEndpoint('www.satishmyla.com');
        httpresponse response=p.send(request);
        string result=response.getBody();
        account a=new account();
        a.name=result;
        a.Industry='banking';
        a.rating='hot';
        insert a;
          
    }
}