({
	add : function(component, event, helper) {
        console.log("step1");
        helper.show(component);
        var acall=component.get("v.aval");
        console.log(acall);
        var bcall=component.get("v.bval");
        var result=parseInt(acall)+parseInt(bcall);
        console.log(result);
        component.set("v.result",result);
           
	}
   
})