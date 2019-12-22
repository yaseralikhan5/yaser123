({
	sum : function(component, event, helper) {
        helper.show(component);
        var a=component.get("v.aval");
        var b=component.get("v.bval");
        var result=parseInt(a)+parseInt(b);
        component.set("v.result",result);
		
	},
    mul: function(component, event, helper) {
        helper.show(component);
        var a=component.get("v.aval");
        var b=component.get("v.bval");
        var result=parseInt(a)*parseInt(b);
        component.set("v.result",result);
		
	}
})