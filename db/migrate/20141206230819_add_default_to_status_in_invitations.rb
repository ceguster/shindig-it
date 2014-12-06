class AddDefaultToStatusInInvitations < ActiveRecord::Migration
  def change
    change_column :invitations, :status, :string, :default => "pending"
  end
end
