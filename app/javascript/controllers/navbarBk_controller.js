import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "navBkBtn" ]

  show() {
    const navBkTarget = document.querySelector("#navBkDropDown");
    navBkTarget.classList.toggle("show");
  }

  close() {
    const navBkTarget = document.querySelector("#navBkDropDown");
    navBkTarget.classList.toggle("show");
  }
}

