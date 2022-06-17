({
    handleChanged : function(component, message, helper) {
        if(message != null && message.getParam("recordId") != null){
            component.set("v.contactId", message.getParam("recordId"));
        }
    }
})
