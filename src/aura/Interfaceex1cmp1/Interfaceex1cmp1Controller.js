({
	show : function(component, event, helper) {
		component.set("v.name","yaser");
	},
    invoke : function(component, event, helper) {
		console.log("this is invoked method");
	},
     populate : function(component, event, helper) {
		console.log("this event is invoked");
	},
    populate : function(component, event, helper) {
		var ev=component.getEvent("InterfaceEvent");
        ev.setParam({"events":"yaser"});
        ev.fire();
	}
})