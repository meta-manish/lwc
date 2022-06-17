import { LightningElement } from 'lwc';

export default class EventPropagation extends LightningElement {
    handleClick(){
        alert('app Listened');
    }
}