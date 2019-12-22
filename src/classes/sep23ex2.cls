public class sep23ex2 {
    public apexpages.StandardSetController controller {set;get;}
    public list<account> acc1 {set;get;}
    public list<contact> con1 {set;get;}
    public string xmlstring {set;get;}
    
    public list<account> getacc(){
        list<account> acc=(list<account>)controller.getRecords();
        return acc;
    }
    public sep23ex2(){
        list<account> accounts=[select id,name,industry,rating from account];
        controller=new apexpages.StandardSetController(accounts);
        controller.setPageSize(5);
        list<list<sobject>> result=[find 'yaser' in all fields returning account(name,industry,rating),contact(lastname,firstname)];
  acc1=(list<account>)result[0];
        con1=(list<contact>)result[1];
        invoke();
        
    }
    public void invoke(){
        dom.Document doc=new dom.Document();
        
        dom.XmlNode root=doc.createRootElement('Yaser', null, null);
        
        dom.XmlNode child1=root.addChildElement('Ali', null, null);
        child1.setAttribute('qualification', 'btech');
        child1.setAttribute('age', '24');
        xmlstring=doc.toXmlString();
        
        
    }
}