class AddCourseToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :yummly_large_image, :string
    add_column :contributions, :yummly_num_servings, :string
    add_column :contributions, :yummly_time, :string
  end
end
