import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "template", "link" ]

  search_date(event) {
    event.preventDefault();

    let content = this.templateTarget.innerHTML.replace(/ADD_DATE/g, new Date().getTime());
    this.linkTarget.insertAdjacentHTML('beforebegin', content);
  }
}
