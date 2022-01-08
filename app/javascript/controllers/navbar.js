import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["navDBtn", "navLgDBtn"]
}

  connect ()

  displayNav() {
    document.getElementById("navDropDown").classList.toggle("show");
  }

  window.onclick = function(event) {
    if (!event.target.matches('.navDBtn')) {
      var dropdowns = document.getElementsByClassName("navDropDownContent");
      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }

  displayNavLg() {
    document.getElementById("navDropDownLg").classList.toggle("show");
  }

  window.onclick = function(event) {
    if (!event.target.matches('.navLgDBtn')) {
      var dropdowns = document.getElementsByClassName("navDropDownLgContent");
      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }