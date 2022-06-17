import ContactMobile from '@salesforce/schema/Case.ContactMobile';
import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {
    handleChildClick(event){
        alert('clicked child');
    }

    handleDivClick(event){
        alert('div Clicked');
    }
}