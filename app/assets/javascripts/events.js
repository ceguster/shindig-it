
$(document).ready(function(){

  $('#wrapper').on('click', '.unclaimed', function(e){
    e.preventDefault();
    var eventId = $(this).parent().data('id');
    var contributionId = $(this).parent().attr('id');
    var liEl = $(this).parent();
    var username = $(this).parents('ul').attr('id');

    $.ajax ({

      url: '/events/' + eventId + '/contributions/' + contributionId ,
      method: 'patch',
      success: function(){
        $('#unclaimed-' + contributionId).remove();
        $(liEl).append('claimed by ' + username + ' - <div class="claimed" id="claimed-' + contributionId + '">Unclaim</div>');
      }

    });
    
  });
});



  