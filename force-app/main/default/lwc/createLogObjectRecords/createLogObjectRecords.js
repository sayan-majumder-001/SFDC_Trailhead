import { api, track, LightningElement } from 'lwc';
import callTestServiceMethod from '@salesforce/apex/CallTestServiceImpl.callTestServiceMethod';

export default class CreateLogObjectRecords extends LightningElement {

  receivedMessage;
  sfdcBaseURL;
  logSFDCId;
  hasRendered = false;
  @api recordId;
  @track logRecords;
  @track error;
  noLog = false;

  connectedCallback() {
  }

  handleClick(evt) {
    let recordVal = evt.target.dataset.id;
    let logsfdcId = null;
    callTestServiceMethod({ AccountId: recordVal })
      .then(data => {
        console.log('data::::'+data);
        data.forEach(function (logval) {
          logsfdcId = logval.Id;
        });
        this.logRecords = data;
        this.logSFDCId = logsfdcId;
        this.error = null;
        if(this.logRecords === null){
          this.noLog = true;
        }
      })
      .catch(error => {
        this.logRecords = null;
        this.error = error;
      });
  }

  renderedCallback() {
    this.sfdcBaseURL = window.location.origin + '/' + this.logSFDCId;
  }
}