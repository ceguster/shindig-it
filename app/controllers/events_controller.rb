class EventsController < ApplicationController

  def index

  end

  def new
    @event = Event.new
    # @host = User.find(session[:user_id])
  end

  def create
    @event = Event.create(event_params)
    @host = @event.host
    redirect_to event_path(@event)
  end

  def show
    @event = Event.find(params[:id])
    @host = @event.host
  end

  private
    def event_params
      params.require(:event).permit(:name, :details, :tagline, :location, :date, :start_time)
    end

end
