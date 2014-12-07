class ContributionsController < ApplicationController

  #menu search page
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    if params[:contribution][:yummly_recipe_name]
      @contribution = Contribution.create(contribution_params)
    else
      @event = Event.find(params[:event_id])
      @id = params[:contribution][:recipe_id]
      @recipe = Yummly.find(@id)
      @recipe_hsh = {}
      @recipe_hsh[:event_id] = params[:event_id]
      @recipe_hsh[:yummly_recipe_name] = @recipe.name
      @recipe_hsh[:yummly_large_image] = @recipe.images.first.large_url
      @recipe_hsh[:yummly_num_servings] = @recipe.number_of_servings
      @recipe_hsh[:yummly_ingredients] = @recipe.ingredient_lines.join(", ")
      @recipe_hsh[:yummly_time] = @recipe.total_time
      @recipe_hsh[:yummly_source] = @recipe.json["source"]["sourceRecipeUrl"]
      @recipe_hsh[:yummly_id] = @id
      if @recipe.attributes["course"]
        @recipe_hsh[:yummly_course] = @recipe.attributes["course"].first
      else
        @recipe_hsh[:yummly_course] = "other"
      end
      if @recipe.attributes["cuisine"]
        @recipe_hsh[:yummly_cuisine_type] = @recipe.attributes["cuisine"].first
      else
        @recipe_hsh[:yummly_cuisine_type] = "other"
      end
      @contribution = Contribution.create(@recipe_hsh)
    end
  end

  def edit 
    
  end

  def update

  end

  private
    def contribution_params
      params.require(:contribution).permit(:event_id, :yummly_recipe_name, :yummly_id, :yummly_course, :yummly_cuisine_type, :yummly_ingredients, :yummly_large_image, :yummly_num_servings, :yummly_time, :yummly_source)
    end
end