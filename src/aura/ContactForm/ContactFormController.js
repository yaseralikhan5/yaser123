({
	ContactSave : function(component, event, helper) {
        console.log("contact form step1");
        var lname=component.get("v.lastname");
        var fname=component.get("v.firstname");
        var accid=component.get("v.accid");
        var actions=component.get("c.invokeContact");
        actions.setParams({"lname":lname,"fname":fname,"accid":accid});
        actions.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
	var result=response.getReturnValue();
                if(result!==null){
                    console.log("contact inserted");
                }
            }
            
        });
        console.log("contact form step last");
        
        $A.enqueueAction(actions);
		
	}
})