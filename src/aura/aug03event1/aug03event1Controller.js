({
	
    callme1 : function(component, event, helper) {
           console.log("contact method step1");
	var lname=component.find("lname").get("v.value");
        var fname=component.find("fname").get("v.value");
        var accid=component.get("v.accountid");
        var action=component.get("c.contactinsert");
        console.log(lname+'  '+fname+'  '+accid);
        action.setParams({"lname":lname,"fname":fname,"accid":accid});
        action.setCallback(this,function(response){
               console.log("contact method called");
            var state=response.getState();
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                console.log(result);
            }
        });
        $A.enqueueAction(action);
	}
})