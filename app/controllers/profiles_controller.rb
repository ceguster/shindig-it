class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @image = params["/profiles/#{@user.id}"][:image]
    @user.image = @image.original_filename
    @user.save

    redirect_to profile_path(@user)
  end
  
end
