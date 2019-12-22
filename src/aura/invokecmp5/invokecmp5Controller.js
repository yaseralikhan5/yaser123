({
	show : function(component, event, helper) {
        console.log("step1");
		var name=event.getParam("name");
        var industry=event.getParam("industry");
        var rating=event.getParam("rating");
        console.log(rating);
        var abc=component.get("c.invoke1");
        abc.setParams({"name":name,"industry":industry,"rating":rating});
        abc.setCallback(this,function(response){
            if(response.getState()==='SUCCESS'){
                if(response.getReturnValue()==='success'){
                    console.log("account inserted");
                }
            }
        });
        $A.enqueueAction(abc);
	}
})