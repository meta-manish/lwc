import { LightningElement, track, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import findContacts from '@salesforce/apex/ContactController.findContacts';
import { registerListener, unregisterAllListeners } from 'c/pubsub';

export default class PubsubSubscriber extends LightningElement {
    @track searchKey;

    @wire(CurrentPageReference) pageRef;

    @wire(findContacts, { searchKey: '$searchKey' })
    contacts;

    connectedCallback(){
        registerListener("searchKeyChange", this.handleSearchKeyChange, this);
    }

    disconnectedCallback(){
        unregisterAllListeners(this);
    }

    handleSearchKeyChange(searchKey){
        this.searchKey = searchKey;
    }

}