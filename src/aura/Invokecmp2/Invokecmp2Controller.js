({
	show : function(component, event, helper) {
        console.log("step1 controller")
		var empname=event.getParam("name");
        var empage=event.getParam("age");
        console.log(empname,empage);
        component.set("v.name",empname);
        component.set("v.age",empage);
	}
})