import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { fireEvent } from 'c/pubsub';

export default class PubsubPublisher extends LightningElement {
    
    @wire(CurrentPageReference) pageRef;

    handleChange(event){
        fireEvent(this.pageRef, 'searchKeyChange', event.target.value);
    }
}