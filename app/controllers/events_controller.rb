class EventsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
    @host = @event.host
    @menu = @event.menu
    if !@user.invited?(@event) && @user != @host
      redirect_to profile_path(@user), notice: "You can't access events you're not invited to"
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.host = current_user
    @event.save
    redirect_to event_path(@event)
  end

  def edit
    @event = Event.find(params[:id])
    @host = @event.host
  end

  def update
    @event = Event.find(params[:id])
    @time = @event.start_time
    @event.update(event_params)
    if @event.start_time == nil
      @event.start_time = @time
      @event.save
    end

    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:id])
    @user = @event.host
    @event.destroy

    redirect_to profile_path(@user)
  end

  private
    def event_params
      params.require(:event).permit(:name, :details, :tagline, :location, :date, :start_time)
    end

end
