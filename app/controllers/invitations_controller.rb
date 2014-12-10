class InvitationsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @host = @event.host
  end

  def create
    @guest_email = params[:invitation][:guest_email].downcase
    @event = Event.find(params[:event_id])
    @guest = User.find_by(:email => @guest_email)
    @found = Invitation.find_by(event_id: @event.id, guest_email: @guest_email)
    if !@found
      if @guest
        @invitation = Invitation.create(event_id: @event.id, guest_id: @guest.id, guest_email: @guest_email)
      else
        @invitation = Invitation.create(event_id: @event.id, guest_email: @guest_email)
      end
      UserMailer.invitation_email(@guest_email, @event, @event.host).deliver
    end
  end

  def edit
    @event = Event.find(params[:event_id])
    @invitation = Invitation.find(params[:id])
    @user = @invitation.guest
    render layout: false
  end

  def update
    @event = Event.find(params[:event_id])
    @user = current_user
    @invitation = Invitation.find(params[:id])
    @invitation.update(:status => params[:commit])
  end
  
end
