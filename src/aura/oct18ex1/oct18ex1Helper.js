({
	showhelp : function(component) {
		var abc=component.get("c.invoke");
        console.log("step1");
        abc.setCallback(this,function(response){
           var state=response.getState();
            console.log("step2");
            if(state==='SUCCESS'){
                console.log("step3");
                var result=response.getReturnValue();
                console.log(result);
                component.set("v.ligmap",result);
            }
        });
        $A.enqueueAction(abc);
	}
})