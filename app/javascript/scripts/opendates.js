document.addEventListener('turbolinks:load', () => {

  const chooseSeats = document.getElementById("chooseSeats");
  const seatSeletor = document.getElementById("seatSelector");
  const chooseTime = document.getElementById("chooseTime");
  const timeSelector = document.getElementById("timeSelector")

  window.printSeatValue = function() {
    chooseSeats.innerHTML = seatSeletor.value
  };

  window.printTimeValue = function() {
    chooseTime.innerHTML = timeSelector.value
  };
})