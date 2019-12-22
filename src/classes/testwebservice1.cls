global class testwebservice1 implements httpcalloutmock {
    global httpresponse respond(httprequest req){
        httpresponse response=new httpresponse();
        string endpoint=req.getendpoint();
        string method=req.getmethod();
        if(endpoint=='www.satishmyla.com' && method=='POST'){
            string body='dummy data';
            response.setBody(body);
        }
    return response;
    }
    
}