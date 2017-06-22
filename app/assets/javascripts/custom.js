$(document).bind("scroll", function() {
   if ($(document).scrollTop() >= 450) {
       $('.progress').each(function(){
           $(this).find('.progress-bar').animate({
               width:$(this).attr('data-percent')
           },2000);
       });
   }
});


$(document).on("ready", function() {
   
   $(".modal").on("shown.bs.modal",function() {
      $(".main").append('<div class="main-backdrop fade show"></div>');
      $(".fixed-top").css("z-index", "1");
   });
   
   $(".modal").on("hidden.bs.modal",function(){
      $(".main-backdrop").remove();
      $(".fixed-top").css("z-index", "1030");
   });
   
   if ( $(window).width() < 1025 ){
       $('.portfolio-card-container').addClass('manual-flip')
   }
   
});

function rotateCard(btn){
        var $card = $(btn).closest('.portfolio-card-container');
        console.log($card);
        if($card.hasClass('hover')){
            $card.removeClass('hover');
        } else {
            $card.addClass('hover');
        }
    }
    
/*
$( window ).resize(function() {
  if ( $(window).width() < 1025 ){
       $('.portfolio-card-container').addClass('manual-flip')
   }
   else {
       $('.portfolio-card-container').removeClass('manual-flip')
   }
});
*/