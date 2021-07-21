import { LightningElement,api,track } from 'lwc';
import labelName from '@salesforce/label/c.test';

export default class MyfirstLwc extends LightningElement {
 //   @api publicName = 'Sayan Majumder';
    @api publicName;
    @track privatename = 'Deepu';
    phone = '9876565122';
    label={
        labelName,
    };
    
}