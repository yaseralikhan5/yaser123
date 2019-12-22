({
	show3 : function(component,fieldname) {
        var action=component.get("c.invoke");
        var options=[];
         options.push({text:'-none-',value:'-none'});
        action.setParams({"search":fieldname});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
               
                var result=response.getReturnValue();
                for(var i=0;i<result.length;i++){
                    options.push({label:result[i],value:result[i]});
                }
                component.set("v.search",fieldname);
                component.set("v.Fields",options)
            }
        });
        $A.enqueueAction(action);
	}
})