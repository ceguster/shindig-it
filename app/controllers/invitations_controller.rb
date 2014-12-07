class InvitationsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @host = @event.host
  end

  def create
    @guest_email = params[:invitation][:guest_email]
    @event = Event.find(params[:event_id])
    @guest = User.find_by(:email => @guest_email)
    if @guest
      @invitation = Invitation.create(event_id: @event.id, guest_id: @guest.id, guest_email: @guest_email)
    else
      @invitation = Invitation.create(event_id: @event.id, guest_email: @guest_email)
    end
    UserMailer.invitation_email(@guest).deliver
  end

  def edit
    @event = Event.find(params[:event_id])
    @invitation = Invitation.find(params[:id])
    @user = @invitation.guest
  end

  def update
    @event = Event.find(params[:event_id])
    @invitation = Invitation.find(params[:id])
    @user = @invitation.guest

    @invitation.update(:status => params[:commit])
    
    redirect_to profile_path(@user)
  end
  
end
