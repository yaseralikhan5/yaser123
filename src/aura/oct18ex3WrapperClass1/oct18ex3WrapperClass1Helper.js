({
	show2 : function(component) {
		var action=component.get("c.invoke");
        console.log("step1");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.contacts1",result);
                console.log(result);
            }
        });
        $A.enqueueAction(action);
	}
})