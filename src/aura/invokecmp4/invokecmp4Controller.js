({
	save1 : function(component, event, helper) {
		var name=component.get("v.name");
        var industry=component.get("v.industry");
        var rating=component.get("v.rating");
        console.log(name,industry,rating);
        var evtr=component.getEvent("eve");
        evtr.setParams({"name":name,"industry":industry,"rating":rating});
        console.log("event fired");
        evtr.fire();
	},
    cancel : function(component, event, helper) {
        component.set("v.name",'');
        component.set("v.industry",'');
        component.set("v.rating",'');
    }
})