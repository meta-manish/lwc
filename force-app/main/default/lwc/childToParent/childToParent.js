import { LightningElement, track } from 'lwc';

export default class ChildToParent extends LightningElement {
    @track name;
    @track parentArray;
    handleNameEvent(event){
        this.name = event.detail;
    }
    handleButtonClick(event){
        alert("Parent component method calling");
        this.parentArray = event.detail;
    }
}