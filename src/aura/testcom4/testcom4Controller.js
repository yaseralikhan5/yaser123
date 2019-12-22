({
	save : function(component, event, helper) {
		var a=component.find("name").get("v.value");
        var b=component.find("age").get("v.value");
        var c=component.find("course").get("v.value");
        console.log(a+b+c);
        	component.set("v.name",a);
        component.set("v.age",b);
        component.set("v.course",c);
        component.set("v.flag",true);
	},
    invoke : function(component, event, helper) {
	
    },
    cancel : function(component, event, helper) {
		component.find("name").set("v.value","");
        component.find("age").set("v.value","");
        component.find("course").set("v.value","");
        
    }
    })