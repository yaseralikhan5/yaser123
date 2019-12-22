({
	show : function(component, event, helper) {
        component.find("Loader").getNewRecord("Contact",
                                             null,
                                             false,
                                              $A.getCallback(function(){
                                                   var Ncon=component.get("v.newcon");
                                              if(Ncon==null){
            console.log("contact not created");
        }
                                                  else{
                                                      Ncon.AccountId=component.get("v.RecordId");
                                                      component.set("v.con",Ncon);
                                                      console.log("contact instance created");
                                                  }
            
                                                             })
    );
	},
    callme : function(component, event, helper) {
        component.find("Loader").SaveRecord(function(SaveResult){
            if(SaveResult.State==='SUCCESS'){
                console.log("contact created sucessfully");
            }
            else
                console.log("contact not created");
        })
	}
})