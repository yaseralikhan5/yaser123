({
	ShowMethod : function(component,accName,fieldname) {
		var action=component.get("c.invoke");
        var option=[];
        action.setParams({name1:accName,fieldname:fieldname});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                option.push=[{label:'-none-',value:''}];
                             for(var i=0;i<result.length;i++){
                          option.push=[{label:result[i],value:result[i]}];
                            }
            component.set("v.acclist",option);
            }
        });
        $A.enqueueAction(action);
	}
})