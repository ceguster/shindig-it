require 'open-uri'
require 'json'
require 'pry'

  def trial
    url = "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['yummly_application_id']}&_app_key=#{ENV['yummly_application_key']}&q=french&allowedIngredient[]=steak"
    html = open(url).read()
    hsh = JSON.parse(html)
    binding.pry 
  end

  puts trial