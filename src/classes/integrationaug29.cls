public class integrationaug29 {
    public string xmlstring {set;get;}
    public string latLng {set;get;}
    public string search {set;get;}
    public string key {set;get;}
    public string result {set;get;}
    public void invoke(){
       string endpoint='https://maps.googleapis.com/maps/api/place/nearbysearch/json?';
        endpoint = endpoint + 'location=' + latLng + '&types=' + search + '&key=' + key + '&radius=3000';
        httprequest request=new httprequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
       http p=new http();
        httpresponse response=p.send(request);
        result=response.getBody();

    }
}