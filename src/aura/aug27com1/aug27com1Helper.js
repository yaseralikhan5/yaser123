({
	show : function(component) {
		var x=component.find("a").get("v.value");
        var y=component.find("b").get("v.value");
        component.set("v.aval",x);
        component.set("v.bval",y);
        
	}
})