({
	show3 : function(component, event, helper) {
        console.log('step1');
		var accid=event.getParam("accountid");
        console.log(accid);
        component.set("v.accid",accid);
	}
})