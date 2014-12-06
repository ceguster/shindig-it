class EventsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def show
    @event = Event.find(params[:id])
    @host = @event.host
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

  private
    def event_params
      params.require(:event).permit(:name, :details, :tagline, :location, :date, :start_time)
    end

end
