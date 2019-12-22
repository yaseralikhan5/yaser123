({
	callme : function(component, event, helper) {
        var name=event.getParams("name");
        var phone=event.getParams("phone");
        var industry=event.getparams("industry");
        component.set("v.name",name);
        component.set("v.phone",phone);
        component.set("v.industry",industry)
		
	}
})