class ContributionsController < ApplicationController

  #menu search page
  def new
    @event = Event.find(params[:event_id])
  end

  def create

  end
end
