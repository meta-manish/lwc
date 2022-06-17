import { LightningElement, api } from 'lwc';

export default class ChildData extends LightningElement {
    @api name;
    @api childArray;

    @api clickMe(){
        alert("child Component Method");
    }
}