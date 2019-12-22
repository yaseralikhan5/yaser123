({
	accountSave : function(component, event, helper) {
          console.log("acount form step1");
        var name=component.get("v.name");
        var industry=component.get("v.industry");
        var rating=component.get("v.Rating");
        var abc=component.get("c.invokeaccount");
        abc.setParams({"name":name,"industry":industry,"rating":rating});
        abc.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                var ev=$A.get("e.c:ParentChildEvent");
                ev.setParams({"Accountid":result});
                ev.fire();
                console.log("acount form step last");
            }
        });
$A.enqueueAction(abc);		
	}
})