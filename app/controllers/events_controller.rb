class EventsController < ApplicationController

  def new
    @event = Event.new
    @host = User.find(params[:user_id])
  end

  def create
    @event = Event.create(event_params)
    @host = User.find(params[:user_id])
    redirect_to user_event_path(@host, @event)
  end

  def show
    @event = Event.find(params[:id])
    @host = User.find(params[:user_id])
  end

  private
    def event_params
      params.require(:event).permit(:name, :details, :tagline, :location, :date, :start_time)
    end

end
