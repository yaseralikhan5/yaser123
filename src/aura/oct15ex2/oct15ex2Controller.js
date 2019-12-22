({
	callme : function(component, event, helper) {
        var ev=$A.get("e.c:oct15ex1event");
        console.log("step1");
        var names=component.get("v.names");
        ev.setParams({"name1":names});
        console.log("step2");
        ev.fire();
	}
})