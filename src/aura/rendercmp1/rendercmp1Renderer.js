({
	// Your renderer method overrides go here
    render:function(component,helper){
        console.log("this is a render method");
        helper.first(component);
        return this.superRender();
    },
    unrender:function(com,helper){
        console.log("this is a unrender function");
        return this.superUnrender();
    }
    
})