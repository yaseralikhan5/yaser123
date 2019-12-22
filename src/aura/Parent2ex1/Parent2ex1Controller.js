({
	show : function(component, event, helper) {
     // helper.callme(component);
       // console.log("step1");
		var abc=component.get("c.invoke2");
        //console.log("step2");
        abc.setCallback(this,function(response){
            var state=response.getState();
            //console.log(state);
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                //console.log(result);
                component.set("v.acc",result);
            }
        });
        $A.enqueueAction(abc);
	},
      showme : function(component, event, helper){
          var con=event.getSource().getLocalId();
          if(con==='save'){
              component.find("record1").saveRecord(function(saveResult){
                  console.log(saveResult.State);
          });
          
              
          }
      },
    show2 : function(component, event, helper){
        var selected=event.getParam("value");
        //console.log(selected);
        $A.createComponent("c:Parent1ex1",
                           {
                               "flag":true
                           },
                           function(cmp,Status,errorMessage){
                               if(Status==='SUCCESS'){
                                   var body=component.get("v.body");
                                   body.push(cmp);
                                   component.set("v.body",body);
                               }
                           }
            
        );
        }
    })