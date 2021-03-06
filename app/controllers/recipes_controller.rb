require 'open-uri'

class RecipesController < ApplicationController

  def index
    @event = Event.find(params[:event_id].to_i)
    @course = params[:course].strip.split(" ").first
    @cuisine_type = params[:cuisine_type].strip.split(" ").join("+")
    @main_ingredient = params[:main_ingredient].strip.split(" ").join("+")
    if params[:allergy] == "Gluten"
      @allergy = "&allowedAllergy[]=393%5EGluten-Free"
    elsif params[:allergy] == "Peanuts"
      @allergy = "&allowedAllergy[]=394%5EPeanut-Free" 
    elsif params[:allergy] == "Seafood"
      @allergy = "&allowedAllergy[]=398%5ESeafood-Free"
    elsif params[:allergy] == "Soy"
      @allergy = "&allowedAllergy[]=400%5ESoy-Free" 
    elsif params[:allergy] == "Dairy"
      @allergy = "&allowedAllergy[]=396%5EDairy-Free"
    elsif params[:allergy] == "None"
      @allergy = ""
    end
    @url = "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['yummly_application_id']}&_app_key=#{ENV['yummly_application_key']}&q=#{@main_ingredient}&allowedCuisine[]=cuisine%5Ecuisine-#{@cuisine_type}&allowedCourse[]=course%5Ecourse-#{@course}#{@allergy}&maxResult=20&start=0"
    html = open(@url).read()
    hsh = JSON.parse(html)
    @recipes = hsh["matches"].collect do |match|
      recipe_hash = {}
      recipe_hash[:id] = match["id"]
      recipe_hash[:name] = match["recipeName"]
      if match["smallImageUrls"]
        recipe_hash[:image] = match["smallImageUrls"][0]
      else
        recipe_hash[:image] = "no_image2.jpeg"
      end
      recipe_hash[:rating] = match["rating"]
      recipe_hash[:ingredients] = match["ingredients"].join(", ")
      recipe_hash[:event_id] = @event.id
      recipe_hash[:search_course] = params[:course]
      recipe_hash
    end
  end

  def show
    @course = params[:course]
    @event = Event.find(params[:event_id])
    @id = params[:id]
    @recipe = Yummly.find(@id)
    @recipe_hsh = {}
    @recipe_hsh[:name] = @recipe.name
    @recipe_hsh[:large_image] = @recipe.images.first.large_url
    @recipe_hsh[:num_servings] = @recipe.number_of_servings
    @recipe_hsh[:ingredients] = @recipe.ingredient_lines
    @recipe_hsh[:time] = @recipe.total_time
    @recipe_hsh[:source] = @recipe.json["source"]["sourceRecipeUrl"]
    @recipe_hsh[:id] = @id
    if @course == ""
      @recipe_hsh[:course] = "Other"
    elsif @course.split(" ").first.downcase.strip == "main" || @course.split(" ").first.downcase.strip == "side"
      @recipe_hsh[:course] = "Main Course"
    elsif @course.split(" ").first.downcase.strip == "appetizer"
      @recipe_hsh[:course] = "Appetizer"
    elsif @course.split(" ").first.downcase.strip == "dessert"
      @recipe_hsh[:course] = "Dessert"
    else
      @recipe_hsh[:course] = "Other"
    end
    if @recipe.attributes["cuisine"]
      @recipe_hsh[:cuisine_type] = @recipe.attributes["cuisine"].first
    else
      @recipe_hsh[:cuisine_type] = "other"
    end
    render layout: false
  end
    
end
