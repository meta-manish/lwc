import { LightningElement, track, wire } from 'lwc';
import getContacts from "@salesforce/apex/ContactController.getContacts";
import { publish, MessageContext } from 'lightning/messageService';
import LMS_DEMO_CHANNEL from "@salesforce/messageChannel/lmsDemo__c";

export default class LightningMessageServicePublisher extends LightningElement {
    @wire(MessageContext)
    messageContext;
    
    @track contactList;

    connectedCallback() {
        getContacts()
            .then(result =>{
                this.contactList = result;
            })
            .catch(error =>{
                this.contactList = error;
            });
    }

    handleClick(event) {
        const message = {
            recordId: event.target.dataset.value,
        };
        publish(this.messageContext, LMS_DEMO_CHANNEL, message);
    }
}