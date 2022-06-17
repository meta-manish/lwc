({
    myAction : function(component, event, helper) {
        var action = component.get("c.getContacts");
        action.setCallback(this, function(response){
            var contacts = response.getReturnValue();
            component.set("v.contactList", contacts);
        });
        $A.enqueueAction(action);
    },
    handleClick : function(component, event, helper) {
        event.preventDefault();
        var payload = {
            recordId : event.target.dataset.value
        };
        component.find("lmsDemo").publish(payload);
    }
})
