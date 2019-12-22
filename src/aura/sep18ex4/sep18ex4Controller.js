({
	show : function(component, event, helper) {

        $A.createComponent("c:sep18ex3",{},
                           function(cmp,Status){
                               console.log("step1");
                               
                               console.log("step1");
                               component.find("myblock").showCustomModal({
                                   
                                   header:"Applica",
                                   body:cmp,
                                   
                                   showCloseButton:true,
                                   cssClass:"myModel",
                                   closeCallback:function(){
                                       alert("you closed the window");
                                   }
                               })
                           });
	}
})