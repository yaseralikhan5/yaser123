({
	show : function(component, event, helper) {
        console.log("step1");
		var modelbody;
        $A.createComponent(            
                "c:popupcom1",
                {},           
        
                           function(cmp,status,ErrorMessage){
            modelbody=cmp;
                               console.log("step2");
            component.find("myblock").showCustomModal({
                header:"appilcation",
                body:cmp,
                showclosebutton:true,
                closeCallback:function(){
                alert("you closed the alert");
                    console.log("last");
            }
            });
        });
	}
})