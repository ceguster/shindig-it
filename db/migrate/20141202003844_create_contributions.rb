class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :guest_id
      t.integer :event_id
      t.string  :yummly_recipe_name
      t.string  :yummly_id
      t.string  :yummly_course
      t.string  :yummly_cuisine_type
      t.text    :yummly_ingredients
      t.timestamps
    end
  end
end
