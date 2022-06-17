import { LightningElement } from 'lwc';

export default class Child extends LightningElement {
    handleClick(){
        const buttonClick = new CustomEvent('btnclick',{
            bubbles : true,
            composed : true
        });
        this.dispatchEvent(buttonClick);
    }
}