({
	show1 : function(component, event, helper) {
        var search=component.get("v.search1");
        var ev=$A.get("e.c:oct30FieldEvent");
        ev.setParams({"search":search});
         ev.fire();            
	}
})