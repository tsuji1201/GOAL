$(function(){
  $('.menu').hover(function(){
    $(".menu__pull:not(:animated)").slideDown();
  },function(){
    $(".menu__pull").slideUp();
  });
});