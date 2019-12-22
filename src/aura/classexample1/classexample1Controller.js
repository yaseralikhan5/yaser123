({
        show : function(component, event, helper) {
            // Read the values of the attributes 
             var empName =component.get("v.empName");
             var salary =component.get("v.salary");
             var age =component.get("v.age");
             var empSalary=parseFloat(salary);
             var empAge=parseInt(age);
             // create the refference to the method 
             var action =component.get("c.callMe");
             // set the parameters to the method 
             action.setParams({"name":empName,"age":empAge,"salary":empSalary});
             // create callback action 
             action.setCallback(this,function(response){
                 // Get the state 
                 var state =response.getState();
                 // check the state 
                 if(state ==='SUCCESS'){
                     var result =response.getReturnValue();
                     console.log(result);
                 }
             });
             // enqueue aaction 
             $A.enqueueAction(action);
        }
    })