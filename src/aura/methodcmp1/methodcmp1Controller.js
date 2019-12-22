({
	invoke : function(component, event, helper) {
		var params=event.getParam("arguments");
        var name=params.name;
        var age=params.age;
        component.set("v.empname",name);
        component.set("v.age",age);
	}
})