class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :host_id
      t.string  :name
      t.text    :details
      t.date    :date
      t.time    :start_time
      t.string  :location
      
      t.timestamps
    end
  end
end
