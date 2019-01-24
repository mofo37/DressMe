$(document).ready(function(){
    updateRangeValue($('input[type=range]'));
    $('input[type=range]').on('input change',function(){
        var input = $(this);
        updateRangeValue(input);
    });    
});
function updateRangeValue(input){
    var value = input.val();
    var maximum = input.attr('max'); 
    var inputWidth = input.width();
    
    var offLeft = Math.floor((value / maximum) * inputWidth - (((value / maximum) * inputWidth - inputWidth/2) / 100) * 24);    
    var offLeftAbs = value == maximum ? input.offset().left - 15 + offLeft : input.offset().left - 10 + offLeft;
    input.next('.text').css({'left': offLeftAbs +'px'});
    input.next('.text').html(value);
}