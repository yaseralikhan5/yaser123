({
	show : function(component, event, helper) {
        
        var field=[{"label":"name","value":"name"},
                   {"label":"industry","value":"industry"},
                   {"label":"phone","value":"phone"},
                   {"label":"ownership","value":"ownership"},
                  ];
                  
        component.set("v.Fields",field);
	},
                   	callme : function(component, event, helper) {
      var val=event.getParam('value');
                   component.set("v.selected",val);
                   console.log(val);
	}
})