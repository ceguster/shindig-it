require 'open-uri'

class RecipesController < ApplicationController

  def index
    @event = Event.find(params[:event_id].to_i)
    @course = params[:course]
    @cuisine_type = params[:cuisine_type]
    @main_ingredient = params[:main_ingredient]
    @url = "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['yummly_application_id']}&_app_key=#{ENV['yummly_application_key']}&q=#{@main_ingredient}&allowedCuisine=cuisine%5Ecuisine-#{@cuisine_type}&allowedCourse=course%5Ecourse-#{@course}"
    html = open(@url).read()
    hsh = JSON.parse(html)
    @recipes = hsh["matches"].collect do |match|
      recipe_hash = {}
      recipe_hash[:id] = match["id"]
      recipe_hash[:name] = match["recipeName"]
      if match["smallImageUrls"]
        recipe_hash[:image] = match["smallImageUrls"][0]
      else
        recipe_hash[:image] = "brianne_on_a_seat.jpg"
      end
      recipe_hash[:rating] = match["rating"]
      recipe_hash[:ingredients] = match["ingredients"].join(", ")
      recipe_hash[:event_id] = @event.id
      recipe_hash
    end
    # binding.pry
  end

  def show
    # raise params.inspect
    @event_id = params[:event_id]
    @id = params[:id]
    @recipe = Yummly.find(@id)
    @recipe_hsh = {}
    @recipe_hsh[:name] = @recipe.name
    @recipe_hsh[:large_image] = @recipe.images.first.large_url
    @recipe_hsh[:num_servings] = @recipe.number_of_servings
    @recipe_hsh[:ingredients] = @recipe.ingredient_lines
    @recipe_hsh[:time] = @recipe.total_time
    @recipe_hsh[:source] = @recipe.json["source"]["sourceRecipeUrl"]
    render layout: false
  end
    
end
