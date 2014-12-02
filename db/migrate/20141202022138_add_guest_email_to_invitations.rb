class AddGuestEmailToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :guest_email, :string
  end
end
