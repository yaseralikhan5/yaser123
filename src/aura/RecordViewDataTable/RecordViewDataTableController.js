({
	show : function(component, event, helper) {
        var actions=[{label:"view",name:"View",iconName:"action:preview"},
                    {label:"Edit",name:"Edit",iconName:"action:edit"},
                    {label:"Delete",name:"Delete",iconName:"action:delete"}
                    ];
        var fields=[{label:"Name",fieldName:"Name",type:"text"},
                    {label:"Industry",fieldName:"Industry",type:"text"},
                    {label:"Rating",fieldName:"Rating",type:"text"},
                    {type:"action",typeAttributes:{rowActions:actions}}
                   ];
                    
                    component.set("v.fields",fields);
                 
                    var search=event.getParam("search");
               console.log(search);
                    var flag1=event.getParam("flag1");
                    console.log(flag1);
                    component.set("v.Flag1",flag1);
                    
                    var abc=component.get("c.populate");
                    abc.setParams({"str":search});
                    
                    abc.setCallback(this,function(response){
                    var state=response.getState();
                    
                    if(state==='SUCCESS'){
                    
                    var result=response.getReturnValue();
                    console.log(result);
                    component.set("v.acc",result);
                    
                    }
                    });
                    $A.enqueueAction(abc);
                    
                    
	},
                    invoke : function(component, event, helper){
                    var selectedrows=event.getParam("selectedRows");
                        for(var i=0;i<selectedrows.length;i++){
                             console.log(selectedrows[i].Name);
                        }
                   
                    },
     populate1 : function(component, event, helper){
                    var rowselected=event.getParam("row");
         var modeselected=event.getParam("action");
         console.log(modeselected.name);
         var ev2=$A.get("e.c:RecordEvent2");
         ev2.setParams({"accid":rowselected.Id,"mode":modeselected.name});
         ev2.fire();
         console.log("event fired");
                    }
                    
})