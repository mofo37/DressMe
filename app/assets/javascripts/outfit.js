$(document).ready(function(){
    $("#outfit_formality").on('input change',function(){
        const value = $("#outfit_formality").val()
        $(".text").text(value)
    });    
});

$(document).ready(function() {
    $(".pieces").hide();
        $(".show-pieces").click(function(e) {
            e.preventDefault();
            $(".pieces").toggle();
    });
});