$(document).ready(function(){
  $('.change-image-form').hide();

  $('.profile-image').on('dblclick', function(){
    $('.change-image-form').toggle();
  });

});