$(document).ready(function () {
  // Syncs the outfit formality slider on the outfit form with the text value below it. 
  $("#outfit_formality").on('input change', function () {
    var slider_value = $("#outfit_formality").val()
    $(".text").text(slider_value)
  });
  
  // Hides and shows pieces in the outfit form.
  $(".pieces").hide();
  $(".pieces-button").click(function (e) {
    e.preventDefault();
    $(".pieces").toggle();
  });
});