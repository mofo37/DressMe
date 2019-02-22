$(document).ready(function () {
  $("#outfit_formality").on('input change', function () {
    var slider_value = $("#outfit_formality").val()
    $(".text").text(slider_value)
  });
});

$(document).ready(function () {
  $(".pieces").hide();
  $(".pieces-button").click(function (e) {
    e.preventDefault();
    $(".pieces").toggle();
  });
});