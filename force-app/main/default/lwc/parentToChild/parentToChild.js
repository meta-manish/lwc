import { LightningElement, track } from 'lwc';

export default class ParentToChild extends LightningElement {
    nameProperty;
    index = 3;
    @track arr = [
        {
            id:1,
            name:'Aniket'
        },
        {
            id:2,
            name:'Abhay'
        }
    ];

    handleNameChange(event){
        this.nameProperty = event.target.value;
    }

    handleClick(){
        this.template.querySelector('c-child-data').clickMe();
        this.arr.push({
            id:this.index,
            name:this.nameProperty
        });
        this.index+=1;
    }

}