document.addEventListener('turbolinks:load', () => {

  const mouseTarget = document.getElementById("navTarget");
  const mouseTargetLg = document.getElementById("navTargetLg");

  mouseTarget.addEventListener('mouseenter', e => {
    document.getElementById("navDropDown").classList.toggle("show");
  });

  mouseTarget.addEventListener('mouseleave', e => {
    document.getElementById("navDropDown").classList.toggle("show");
  });

  mouseTargetLg.addEventListener('mouseenter', e => {
    document.getElementById("navDropDownLg").classList.toggle("show");
  });

  mouseTargetLg.addEventListener('mouseleave', e => {
    document.getElementById("navDropDownLg").classList.toggle("show");
  });
})
