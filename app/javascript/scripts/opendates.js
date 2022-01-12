document.addEventListener('turbolinks:load', () => {

  window.printSeatValue = function() {
    document.getElementById("chooseSeats").innerHTML = document.getElementById("seatSelector").value
  };

  window.printTimeValue = function() {
    document.getElementById("chooseTime").innerHTML = document.getElementById("timeSelector").value
  };
})