public class jsontest3 {
    public jsontest3(){
        list<account> acc=[select name,industry from account];
        dom.Document doc=new dom.Document();
       dom.XmlNode root=doc.createrootelement('accounts',null,null);
        for(account a:acc){
		dom.XmlNode child=root.addchildelement('account',null,null);
            child.setAttribute('name', a.name);
            if(a.industry!=null){
                child.setAttribute('industry', a.industry);
            }
        }
        string xmlstring=doc.toXmlString();
        system.debug(xmlstring);
    }
}