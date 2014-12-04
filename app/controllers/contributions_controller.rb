class ContributionsController < ApplicationController

  #menu search page
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @contribution = Contribution.create(contribution_params)
  end

  private
    def contribution_params
      params.require(:contribution).permit(:event_id, :yummly_recipe_name, :yummly_id, :yummly_course, :yummly_cuisine_type, :yummly_ingredients, :yummly_large_image, :yummly_num_servings, :yummly_time)
    end
end