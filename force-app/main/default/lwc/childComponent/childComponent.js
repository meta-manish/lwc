import { LightningElement, track } from 'lwc';

export default class ChildComponent extends LightningElement {
    @track name;
    arr = [
        {
            id:1,
            name:'Hello'
        },
        {
            id:2,
            name:'World'
        }
    ];
    handleChange(event){
        this.name = event.target.value;
        const nameEvent = new CustomEvent("getname",{
            detail: this.name
        });
        this.dispatchEvent(nameEvent);
    }

    handleClick(){
        const clickEvent = new CustomEvent("btnclick",{
            detail: this.arr
        });
        this.dispatchEvent(clickEvent);
    }
}