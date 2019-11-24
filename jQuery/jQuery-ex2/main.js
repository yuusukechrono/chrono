$(function(){
  $('#accordion dd').hide();
  $('#accordion dt').click(function(){
    $(this).next('dd').slideToggle();
  });
});
