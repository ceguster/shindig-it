
$(document).ready(function(){

  $('.event-menu').on('click', '.unclaimed', function(e){
    e.preventDefault();
    var eventId = $(this).parents('ul').data('id');
    var contributionId = $(this).data('id');
    var liEl = $(this).siblings('li');
    var username = $(this).parents('ul').attr('id');
    $.ajax ({
      url: '/events/' + eventId + '/contributions/' + contributionId ,
      method: 'patch',
      success: function(){
        $('#unclaimed-' + contributionId).remove();
        $('.claimed-unclaimed-' + contributionId ).prepend('<div id="claim-name-' + contributionId + '"class="claim-name">claimed by ' + username + ' </div><div class="claimed" id="claimed-' + contributionId + ' data-id="' + contributionId + '">Unclaim</div>');
      }
    });
  });

  $('.event-menu').on('click', '.claimed', function(e){
    e.preventDefault();
    var eventId = $(this).parents('ul').data('id');
    var contributionId = $(this).data('id');
    var liEl = $(this).siblings('li');
    var claimName = $(this).siblings('#claim-name-' + contributionId);
    // debugger;
    $.ajax ({
      url: '/events/' + eventId + '/contributions/' + contributionId ,
      method: 'patch',
      success: function(){
        $('#claimed-' + contributionId).remove();
        $(claimName).remove();
        $('.claimed-unclaimed-' + contributionId).prepend('<div class="unclaimed" id="unclaimed-' + contributionId + '"data-id="' + contributionId + '">Claim</div>');
      }
    }); 
  });
});



  