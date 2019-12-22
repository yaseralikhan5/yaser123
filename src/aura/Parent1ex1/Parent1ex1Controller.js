({
	callme : function(component, event, helper) {
        var fields=[{label:'Name',fieldName:'Name',type:'text'},
                    {label:'Industry',fieldName:'Industry',type:'text'},
                    {label:'Rating',fieldName:'Rating',type:'text'},
                   ];
                   // var search=event.getParam("search");
                    component.set("v.fields",fields);
                    var abc=component.get("c.invoke2");
                    //abc.setParams({"str":search});
                    console.log("step1");
                    abc.setCallback(this,function(response){
                    console.log("step2");
                    var state=response.getState();
                    console.log(state);
                    if(state==='SUCCESS'){
                    var result=response.getReturnValue();
                    console.log(result);
                    component.set("v.flag",true);
                    component.set("v.acc",result);
                    
                    }
                    });
                    $A.enqueueAction(abc);
	},
                    show1 : function(component, event, helper){
                    var records=event.getParam('selectedRows');
                    console.log(records.id);
                    },
                    show2 : function(component, event, helper){
                    var rowselected=event.getParam('row');
                        console.log(rowselected);
                        var actiondata=event.getParam('action');
                        console.log(actiondata.name);
                    }
                    
})