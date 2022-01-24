import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "navBtn", "navLgBtn" ]

  show() {
    const navTarget = document.querySelector("#navdrop");
    const navLgBtn = document.querySelector("#navLgBtn");
    navTarget.classList.toggle("show");
  }

  close() {
    const navTarget = document.querySelector("#navdrop");
    navTarget.classList.toggle("show");
  }

  showLg() {
    const navLgBtn = document.querySelector("#navLgBtn");
    const navLgTarget = document.querySelector("#navDropLg")
    navLgTarget.classList.toggle("show");
  }

  closeLg(){
    const navLgTarget = document.querySelector("#navDropLg")
    navLgTarget.classList.toggle("show");
  }

  connect(){
    console.log('triggered by touch:',this.triggeredByTouch ? 'yes' : 'no')
  }
}

