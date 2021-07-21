import { LightningElement } from 'lwc';
export default class sfdcPanHelloWorld extends LightningElement {
  greeting = 'World';
  contacts = [
      {
          Id : '00398jujujujjkjkj322',
          Name: 'Sayan Majumder',
          Title: 'Tech lead'
      },
      {
        Id : '00398jujujujjkjkj122',
        Name: 'Kevin Mclay',
        Title: 'Junior Developer'
    },
    {
        Id : '00398jujujujjkjkj322',
        Name: 'Ashok Dinda',
        Title: 'Developer'
    }

  ];
  changeHandler(event) {
    this.greeting = event.target.value;
  }
}