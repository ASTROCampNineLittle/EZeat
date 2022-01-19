import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "searchDate", "link" ]

  add_date(event) {
    event.preventDefault();

    console.log("Hello");
  }

  connect() {
    console.log("Hi");
    console.log(this);
  }
}
