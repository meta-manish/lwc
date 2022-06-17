({
    createContact : function(component, event, helper) {
        let action = component.get("c.insertContact");
        action.setParams({
            "contact":component.get('v.contact')
        });
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title: "Success!",
            message: "The record has been Inserted successfully.",
            duration: "5000",
            type: "success"
        });
        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === "SUCCESS"){
                component.set('v.createdContact',response.getReturnValue());
                toastEvent.fire();
                component.set('v.contact',{'FirstName':'',
                                           'LastName':'',
                                           'Email':'',
                                           'Phone':'',
                                           'Fax':''});
            }else{
                alert("Failure");
            }
            
        });
        $A.enqueueAction(action);
    }
})