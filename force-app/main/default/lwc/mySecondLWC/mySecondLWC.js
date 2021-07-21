import { LightningElement,api,track } from 'lwc';
import labelName from '@salesforce/label/c.test';
import Id from '@salesforce/user/Id';

export default class MySecondLWC extends LightningElement {

    @api publicName = 'Sayan Majumder';
    @track privatename = 'Deepu';
    email="sayan.majumder112@gmail.com";
    phone = '9876565122';   
    userId=Id;
    label={
        labelName,
    };

    ClickHandler(){
        console.log('double clicked');
        this.publicName='Jethalal';

    }
}