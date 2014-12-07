
$(document).ready(function(){

  $('#wrapper').on('click', '.unclaimed', function(e){
    e.preventDefault();
    var eventId = $(this).parent().data('id');
    var contributionId = $(this).parent().attr('id');
    var liEl = $(this).parent();
    $.ajax ({

      url: '/events/' + eventId + '/contributions/' + contributionId ,
      method: 'patch',
      success: function(){
        $('#unclaimed-' + contributionId).remove();
        $(liEl).append('hi');
//   $('#<%=@contribution.id%>').append('<div class="claimed-<%=@contribution.id%>"> claimed by <%= @contribution.guest.full_name %> - <%= link_to("Unclaim", event_contribution_path(@event, @contribution), method: "patch", remote: true) %></div>');
// }
      }

    });
    
  });
});



  