class InvitationsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @host = @event.host
  end

  def create
    binding.pry
    @guest_email = params[:invitation][:guest_email]
    @event = Event.find(params[:event_id])
    @guest = User.find_by(:email => @guest_email)
    if @guest
      @invitation = Invitation.create(event_id: @event.id, guest_id: @guest.id, guest_email: @guest_email)
    else
      @invitation = Invitation.create(event_id: @event.id, guest_email: @guest_email)
    end
    binding.pry
  end

  def edit
  end
  
end
