({
	show : function(component, event, helper) {
var columns=[
    {label:"name",fieldName:"Name",type:"text"},
    {label:"industry",fieldName:"Industry",type:"text"},
    {label:"rating",fieldName:"Rating",type:"text"},
];
    console.log("step1");
    component.set("v.fields",columns);
   var abc= component.get("c.invoke1");
    abc.setCallback(this,function(response){
    var state=response.getState();
    if(state==='SUCCESS'){
    console.log("step2");
    var result=response.getReturnValue();
    console.log(result);
    component.set("v.accounts",result);
    
    }
    });
    $A.enqueueAction(abc);
	},
    
    invoke : function(component, event, helper){
    var action1=component.get("c.populate");
    var acc=component.get("v.acc");
    action1.setParams({"acc":acc});
    action1.setCallback(this,function(response){
    var state=response.getState();
    if(state==='SUCCESS'){
    var result=response.getReturnValue();
    component.set("v.accounts",result);
    }
    });
    $A.enqueueAction(action1);
    },
    rowselection:function(component, event, helper){
    var rows=event.getParam('selectedRows');
    component.set("v.count",rows.length);
    }
})