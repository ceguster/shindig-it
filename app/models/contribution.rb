class Contribution < ActiveRecord::Base

  belongs_to :guest, :class_name => "User"
  belongs_to :event

  #Yummly.search('Onion Soup')
  #result.collect { |recipe| recipe.name }

  #Yummly.find("Dirty-Steak-Epicurious-54113")
  #recipe.name

  
  #steak.json["source"]["sourceRecipeUrl"]
end
