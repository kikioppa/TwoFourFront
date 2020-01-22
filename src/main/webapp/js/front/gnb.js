//gnb
$(document).ready(function() {

  $(".gnb > li").on("mouseenter", function() {
    $(".gnb > li").removeClass('on');
    $(this).addClass('on');
  });
  $(".nav").on("mouseleave", function() {
    $(".gnb > li").not('.hover').removeClass('on');
    $(".hover").addClass('on');
  });
});