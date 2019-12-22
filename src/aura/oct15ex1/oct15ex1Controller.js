({
	show : function(component, event, helper) {
        var actions=[{label:'View',name:'View'},
                     {label:'Edit',name:'Edit'}];
        var field=[{label:'Name',fieldName:'Name',type:'text'},
                   {label:'Industry',fieldName:'Industry',type:'text'},
                   {label:'Rating',fieldName:'Rating',type:'text'},
                   { type: 'action', typeAttributes: { rowActions: actions }}
                  ];
                   console.log('step3');
                   component.set('v.fields',field);
                   var abc=component.get('c.invoke1');
                   var name=event.getParam("name1");
                   console.log("name is "+ name);
                   console.log('step4');
                   abc.setParams({"name":name});
                   abc.setCallback(this,function(response){
                   console.log('step5');
                   var state=response.getState();
                   if(state==='SUCCESS'){
                   var result=response.getReturnValue();
                   component.set('v.accounts',result);
                   }
                   });
                   $A.enqueueAction(abc);
                   
	},
                   show2 : function(component, event, helper) {
                   var accid=event.getParam("row");
                   console.log(accid.Id);
                     
                       var ev2=$A.get("e.c:oct15ex2event1");
                       console.log(ev2);
                   ev2.setParams({"accountid":accid.Id});
                       console.log("event fired");
                   ev2.fire();
                   
                   }
})