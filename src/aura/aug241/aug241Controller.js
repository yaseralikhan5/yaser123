({
	callme : function(component, event, helper) {
        var name=component.find("name").get("v.value");
        var phone=component.find("phone").get("v.value");
        var industry=component.find("industry").get("v.value");
        var ev=$A.get("e.c:account_first");
        ev.setParams({"name":name,"phone":phone,"industry":industry});
        ev.fire();
		
	}
})