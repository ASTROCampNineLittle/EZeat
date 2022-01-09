document.addEventListener('turbolinks:load', () => {

  const mouseTarget = document.getElementById("mouseTarget");
  const mouseTargetLg = document.getElementById("mouseTargetLg");

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