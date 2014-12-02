class UsersController < ApplicationController

  def new
    @user = User.new
  end
#when a user signs up, after create, check all invitations to see if any pending invites for that user. If so, assign user's id to guest_id for that invite. Know it is the same user based on email they use to sign up, assuming it is the same as the guest_email of invite.


  def show
    @user = User.find(params[:id])
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :image_path)
    end
  
end
