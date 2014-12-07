
$(document).ready(function(){

  $('#wrapper').on('click', '.unclaimed', function(e){
    e.preventDefault();
    // e.stopPropagation();
    var eventId = $(this).parent().data('id');
    var contributionId = $(this).parent().attr('id');
    var liEl = $(this).parent();
    var username = $(this).parents('ul').attr('id');
    $.ajax ({

      url: '/events/' + eventId + '/contributions/' + contributionId ,
      method: 'patch',
      success: function(){
        $('#unclaimed-' + contributionId).remove();
        $(liEl).append('<div id="claim-name-' + contributionId + '">claimed by ' + username + ' -</div><div class="claimed" id="claimed-' + contributionId + '">Unclaim</div>');
      }

    });
    
  });

  $('#wrapper').on('click', '.claimed', function(e){
    e.preventDefault();
    // e.stopPropagation();
    var eventId = $(this).parent().data('id');
    var contributionId = $(this).parent().attr('id');
    var liEl = $(this).parent();
    var claimName = $(this).siblings('#claim-name-' + contributionId)

    $.ajax ({

      url: '/events/' + eventId + '/contributions/' + contributionId ,
      method: 'patch',
      success: function(){
        $('#claimed-' + contributionId).remove();
        $(claimName).remove();
        $(liEl).append('<div class="unclaimed" id="unclaimed-' + contributionId + '">Claim</div>');
      }

    });
    
  });
});



  