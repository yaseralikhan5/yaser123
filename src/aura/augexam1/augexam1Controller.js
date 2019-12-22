({
	show : function(component, event, helper) {
    var acc=component.get("v.acc");
        var xyz=component.get("c.createaccs");
        xyz.setParams({"acc":acc});
        xyz.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.Accounts",result);
                console.log(result);
            }
        })
        $A.enqueueAction(xyz);
       },
    invoke : function(component, event, helper) {
        var columns=[
            {label:"Name",fieldName:"Name",type:"text"},
            {label:"Phone",fieldName:"Phone",type:"text"},
            {label:"Industry",fieldName:"Industry",type:"text"},
            {label:"Rating",fieldName:"Rating",type:"text"},
        ];
          component.set("v.Fields",columns);
		var action =component.get("c.setaccs");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var result =response.getReturnValue();
                component.set("v.Accounts",result);
            }
        });
        $A.enqueueAction(action);
	}
                    
                     
       
})