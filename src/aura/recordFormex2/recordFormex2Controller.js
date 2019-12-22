({
	callme : function(component, event, helper) {
        console.log("step1");
        component.find("records").saveRecord($A.getCallback(function(saveResult){
            if(saveResult==='SUCCESS'){
               
            }
        })
                                            );
	},
    deleteme : function(component, event, helper) {
        console.log("step2");
        component.find("records").deleteRecord($A.getCallback(function(deleteResult){
            if(deleteResult==='SUCCESS'){
               alert("The record is deleted");
            }
        })
                                            );
	}
    
})