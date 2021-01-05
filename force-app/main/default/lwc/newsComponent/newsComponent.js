import { LightningElement } from 'lwc';
import retriveNews from "@salesforce/apex/newsController.retriveNews";

export default class NewsComponent extends LightningElement {

    connectedCallback(){
        this.fetchNews();
    }

    fetchNews(){
        retriveNews().then(response => {
            console.log(response);
        }).catch(error=>{
            console.error(error);
        })
    }

}