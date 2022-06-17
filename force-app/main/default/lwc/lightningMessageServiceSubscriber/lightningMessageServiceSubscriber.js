import { LightningElement, track, wire } from 'lwc';
import { subscribe, APPLICATION_SCOPE, MessageContext, unsubscribe } from 'lightning/messageService';
import LMS_DEMO_CHANNEL from "@salesforce/messageChannel/lmsDemo__c";

export default class LightningMessageServiceSubscriber extends LightningElement {
    @wire(MessageContext)
    messageContext;
    subscription = null;
    
    @track contactId;
    @track objectApiName = 'Contact';

    connectedCallback() {
        this.subscribeMessageChannel();
    }

    subscribeMessageChannel() {
        if (this.subscription) {
            return;
        }
        this.subscription = subscribe(
            this.messageContext,
            LMS_DEMO_CHANNEL,
            (message) => this.handleMessage(message),
            { scope: APPLICATION_SCOPE }
        );
    }

    handleMessage(message) {
        this.contactId = message.recordId;
    }

    unSubscribeMessageChannel(){
        unsubscribe(this.subscription);
        this.subscription=null;
    }

    disconnectedCallback(){
        this.unSubscribeMessageChannel();
    }
}