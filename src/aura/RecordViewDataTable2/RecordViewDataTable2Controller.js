({
	invoke1 : function(component, event, helper) {
		var accid=event.getParam("accid");
        var mode=event.getParam("mode");
        component.set("v.recid",accid);
        component.set("v.accmode",mode);
        component.set("v.flag2","true");
    }
})