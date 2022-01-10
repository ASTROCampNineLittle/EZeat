import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "template", "link" ]

  add_date(event) {
    event.preventDefault();

    let content = this.templateTarget.innerHTML.replace(/ADD_DATE/g, new Date().getTime());
    this.linkTarget.insertAdjacentHTML('beforebegin', content);
  }

  delete_date(event) {
    event.preventDefault();

    let inputColumn = event.target.closest('.date-fields');
    if(inputColumn.dataset.newRecord == "true") {
      inputColumn.remove();
    } else {
      inputColumn.querySelector("input[name*='_destroy']").value = 1;
      inputColumn.style.display = 'none' ;
    }
  }
}
