$(document).ready(function(){
  $('.Category').change(function(){
    if($(this).val() == '') $(".hide1").hide('fast');
    else {
       $(".hide1").fadeIn('fast');
    }
  });        
});