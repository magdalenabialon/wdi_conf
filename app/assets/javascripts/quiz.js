$(function(){

  $('#booking').click(function(){
    console.log('hello');
    $('.quizmodal-overlay').css('display', 'flex');
  });

  $('.close-modal').click(function(){
    $('.quizmodal-overlay').css('display', 'none');
  });

});
