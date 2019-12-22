public class jsonex1 {
    public string ipaddr {set;get;}
    public map<string,string> res {set;get;}
    public string status {set;get;}
    public integer statuscode {set;get;}
    public string result {set;get;}
    public void convert(){
        res=new map<string,string>();
    httprequest request=new httprequest();
        request.setEndpoint('http://xml.utrace.de/?query='+ipaddr);
        request.setMethod('GET');
        http p=new http();
        httpresponse response=p.send(request);
        status=response.getStatus();
        statuscode=response.getStatusCode();
        result=response.getBody();
        dom.Document doc=new dom.Document();
        doc.load(result);
        
        dom.XmlNode root=doc.getRootElement();
        
        for(dom.XmlNode child:root.getChildElements())
            for(dom.XmlNode c:child.getChildElements()){
                res.put(c.getName(), c.getText());
            }
        
        }
}