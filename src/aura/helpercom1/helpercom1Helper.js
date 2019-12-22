({
	helperMethod : function() {
        var aval=component.find("aval").get("v.value");
        var bval=component.find("bval").get("v.value");
        component.set("v.aval",aval);
        component.set("v.bval",bval);
		
	}
})