({
	callme : function(component, event, helper) {
		
        console.log("assigning id to attirbute variable");
		var accid=event.getParam("accid");
        console.log(accid);
       // component.set("v.accountid",accid);
        $A.createComponent("c:aug03event1",
                           {
            				"accountid":accid
        					},
                           function(cmp,status,errorMessage){
                               if(status==='SUCCESS'){
                               var body=component.get("v.body");
                               body.push(cmp);
                               component.set("v.body",body);
                                   }
                           }
            
            
        );
	}
})