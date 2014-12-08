class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update
    @user = current_user
    file = params["/profiles/#{@user.id}"][:file].tempfile
    filename = params["/profiles/#{@user.id}"][:file].original_filename
    @user.avatar = File.open(file)
    @user.save!

    redirect_to profile_path(@user)
  end
  
end


