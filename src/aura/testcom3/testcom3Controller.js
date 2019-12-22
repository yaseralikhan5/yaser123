({
	addme : function(component, event, helper) {
		var a=component.get("v.aval");
        var b=component.get("v.bval");
        var result=parseInt(a)+parseInt(b);
        component.set("v.result",result);
	},
    mulme : function(component, event, helper) {
		var a=component.get("v.aval");
        var b=component.get("v.bval");
        var result=parseInt(a)*parseInt(b);
        component.set("v.result",result);
	},
 cancel : function(component, event, helper) {
		component.set("v.aval","");
     component.set("v.bval",null);
        component.set("v.result",0);
	}
})