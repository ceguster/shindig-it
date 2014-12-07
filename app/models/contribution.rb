class Contribution < ActiveRecord::Base

  belongs_to :guest, :class_name => "User"
  belongs_to :event


  # def individual_ingredients
  #   self.yummly_ingredients.split(/, \d/)

  # end
end
