({
	callme : function(component, event, helper) {
        var ser=component.find("search1").get("v.value");
        console.log(ser);
        var ev=component.getEvent("third");
        ev.setParams({"search":ser});
        ev.fire();
        
	}
   
})