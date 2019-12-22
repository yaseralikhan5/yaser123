({
	invoke1 : function(component, event, helper) {
		component.find("con1").saveRecord($A.getCallback(function(saveResult){
                if(saveResult.state==='SUCCESS'){
                    alert("record updated successfully");
                }
            }));
	},
    invoke2 : function(component, event, helper){
        component.find("con1").deleteRecord($A.getCallback(function(deleteResult){
                if(deleteResult.state==='SUCCESS'){
                    alert("record is deleted");
                }
            }));
    }
})