({
	show : function(component, event, helper) {
        console.log("step1");
        $A.createComponent("lightning:button",
                           {
                               "aura:id":"name",
                               "label":"StandardBUtton"
                           },
                           function(cmp,status,errorMessage){
                               if(status==='SUCCESS'){
                                   var body=component.get("v.body");
                                   body.push(cmp);
                                   component.set("v.body",body);
                               }
                           });
	}
})