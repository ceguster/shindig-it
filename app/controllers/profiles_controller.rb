class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update

    @user = current_user
    @user.avatar = params["/profiles/#{@user.id}"][:avatar]
    @user.save

    redirect_to profile_path(@user)
  end


  
end


