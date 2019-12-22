({
	invoke : function(component, event, helper) {
        var columns=[
            {label:"Name",fieldName:"Name",type:"text"},
            {label:"Phone",fieldName:"Phone",type:"text"},
            {label:"Industry",fieldName:"Industry",type:"text"},
            {label:"Rating",fieldName:"Rating",type:"text"},
        ];
        component.set("v.fields",columns);
		var action =component.get("c.getAccs");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var result =response.getReturnValue();
                component.set("v.accounts",result);
            }
        });
        $A.enqueueAction(action);
	},
    show :function(component,event,helper){
         var acc =component.get("v.acc");
         var one =component.get("c.createAcc");  
         one.setParams({"acc":acc});
         one.setCallback(this,function(response){
            var state =response.getState();
            if(state==='SUCCESS'){
            	var result=response.getReturnValue();
            	console.log(result);
            	component.set("v.accounts",result);
            }else{
            	console.log('Error');
            }
       	});
        $A.enqueueAction(one);
           
    }       
})