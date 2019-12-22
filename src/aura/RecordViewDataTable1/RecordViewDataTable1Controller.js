({
	search : function(component, event, helper) {
        var search=component.find("search").get("v.value");
        console.log(search);
        var ev=$A.get("e.c:RecordEvent1");
        ev.setParams({"search":search,"flag1":"true"});
                      ev.fire();
	}
})