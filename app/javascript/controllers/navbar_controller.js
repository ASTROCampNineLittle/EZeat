import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "navBtn", "navDrop" ]

  show() {
    console.log(navDrop);
  }

  connect() {
    console.log("hi");
  }
}
