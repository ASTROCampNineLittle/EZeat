document.addEventListener('turbolinks:load', () => {

  const mouseTarget = document.getElementById("navTarget");
  const mouseTargetLg = document.getElementById("navTargetLg");

  mouseTarget.addEventListener('mouseenter', e => {
    document.getElementById("navDropDown").classList.toggle("hidden");
  });

  mouseTarget.addEventListener('mouseleave', e => {
    document.getElementById("navDropDown").classList.toggle("show");
  });

  mouseTargetLg.addEventListener('mouseenter', e => {
    document.getElementById("navDropDownLg").classList.toggle("hidden");
  });

  mouseTargetLg.addEventListener('mouseleave', e => {
    document.getElementById("navDropDownLg").classList.toggle("show");
  });
})
