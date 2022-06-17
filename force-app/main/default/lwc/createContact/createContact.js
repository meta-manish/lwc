import { LightningElement,track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import createContact from '@salesforce/apex/ContactCreationController.createContact'
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';
import Phone from '@salesforce/schema/Contact.Phone';
import Fax from '@salesforce/schema/Contact.Fax';


export default class CreateContact extends LightningElement {
    @track contactId;
    @track error;
    @track contactRecord={
        FirstName:FirstName,
        LastName:LastName,
        Email:Email,
        Phone:Phone,
        Fax:Fax
    };

    handleFirstNameChange(event){
        this.contactRecord.FirstName = event.target.value;
    }
    handleLastNameChange(event){
        this.contactRecord.LastName = event.target.value;
    }
    handleEmailChange(event){
        this.contactRecord.Email = event.target.value;
    }
    handlePhoneChange(event){
        this.contactRecord.Phone = event.target.value;
    }
    handleFaxChange(event){
        this.contactRecord.Fax = event.target.value;
    }

    saveContact(){
        createContact({ contactRec:this.contactRecord})
        .then(result=>{
            this.contactRecord={};
            this.contactId = result.Id;
            const showToast = new ShowToastEvent({
                title:'Success!',
                message:'Contact Created Successfully',
                varient:'success'
            });
            this.dispatchEvent(showToast);
        })
        .catch(error=>{
            this.error = error.message;
        })
    }
}