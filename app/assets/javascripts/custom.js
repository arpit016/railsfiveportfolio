$(document).bind("scroll", function() {
   if ($(document).scrollTop() >= 450) {
       $('.progress').each(function(){
           $(this).find('.progress-bar').animate({
               width:$(this).attr('data-percent')
           },2000);
       });
   }
});
