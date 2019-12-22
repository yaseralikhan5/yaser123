({
	show : function(component, event, helper) {
           console.log("account controller called");
        var name=component.get("v.Name");
        var industry=component.get("v.Industry");
        var rating=component.get("v.Rating");
        var abc=component.get("c.accountinsert");
        abc.setParams({"name":name,"industry":industry,"rating":rating});
        abc.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
			var result=response.getReturnValue();
                var ev=$A.get("e.c:aug03event");
                ev.setParams({"accid":result});
                ev.fire();
                   console.log("contact event fired");
            }
        });
        $A.enqueueAction(abc);
       
	}
})