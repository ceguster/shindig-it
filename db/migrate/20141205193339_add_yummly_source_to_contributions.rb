class AddYummlySourceToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :yummly_source, :string
  end
end
