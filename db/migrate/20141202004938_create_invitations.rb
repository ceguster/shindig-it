class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :event_id
      t.integer :guest_id
      t.string  :status, :default => nil
      t.timestamps
    end
  end
end
