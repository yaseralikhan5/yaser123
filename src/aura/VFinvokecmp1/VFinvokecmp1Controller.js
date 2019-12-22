({
	show : function(component, event, helper) {
		var search=component.get("v.search");
        console.log(search);
        var abc=component.get("c.populate");
        abc.setParams({"accName":search});
        console.log("step1");
        abc.setCallback(this,function(response){
            var state=response.getState();
            console.log("step2");
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                console.log(result);
                component.set("v.acc",result);
            }
            
        });
        $A.enqueueAction(abc);
	}
})