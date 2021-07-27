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

  connectedCallback() {
  }

  handleClick(evt) {
    let recordVal = evt.target.dataset.id;
    let logsfdcId = null;
    callTestServiceMethod({ AccountId: recordVal })
      .then(data => {
        data.forEach(function (logval) {
          logsfdcId = logval.Id;
        });
        this.logRecords = data;
        this.logSFDCId = logsfdcId;
        this.error = null;
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