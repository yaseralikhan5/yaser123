public class kosmostest1 implements httpcalloutmock {
    public httpresponse respond(httprequest req){
        string endpoint=req.getEndpoint();
        string method=req.getMethod();
        system.assertEquals(endpoint, 'http://data.fixer.io/api/latest?access_key=86c992d96d0ba3928c8b78d731bfb5e5');
        system.assertequals(method,'POST');
        httpresponse response=new httpresponse();
        response.setBody('"rates":{"AED":4.045672,"USD":32.02145}');
        return response;
    }
}