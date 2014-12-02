class ContributionsController < ApplicationController

  #menu search page
  def new
    @event = Event.find(params[:event_id])
    @host = User.find(params[:user_id])
  end

  def create

  end
end
