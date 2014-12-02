class AddTaglineToEvents < ActiveRecord::Migration
  def change
    add_column :events, :tagline, :string
  end
end
