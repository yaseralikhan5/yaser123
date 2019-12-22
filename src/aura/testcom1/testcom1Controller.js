({
	callme : function(component, event, helper) {
      var a=component.get("v.aval");
        var b=component.get("v.bval");
        var result=parseInt(a)+parseInt(b);
        component.set("v.result",result);
    }
})