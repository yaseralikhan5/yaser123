({
	showstep1 : function(component, event, helper) {
        console.log("step1");
		component.set("v.progress","one");
	},
    showstep2 : function(component, event, helper) {
            console.log("step2");
		component.set("v.progress","two");
	},
    showstep3 : function(component, event, helper) {
            console.log("step3");
		component.set("v.progress","three");
	}
})