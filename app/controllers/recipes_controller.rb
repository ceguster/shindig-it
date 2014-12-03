require 'open-uri'

class RecipesController < ApplicationController

  def index 
    @course = params[:course]
    @cuisine_type = params[:cuisine_type]
    @main_ingredient = params[:main_ingredient]
    @url = "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['yummly_application_id']}&_app_key=#{ENV['yummly_application_key']}&q=#{@main_ingredient}&allowedCuisine=cuisine%5Ecuisine-#{@cuisine_type}&allowedCourse=course%5Ecourse-#{@course}"
    html = open(@url).read()
    hsh = JSON.parse(html)
    @recipes = hsh["matches"].collect do |match|
      recipe_hash = {}
      recipe_hash[:name] = match["recipeName"]
      if match["smallImageUrls"]
        recipe_hash[:image] = match["smallImageUrls"][0]
      else
        recipe_hash[:image] = "brianne_on_a_seat.jpg"
      end
      recipe_hash[:rating] = match["rating"]
      recipe_hash[:ingredients] = match["ingredients"].join(", ")
      recipe_hash
    end
  end
    
end
