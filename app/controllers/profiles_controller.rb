class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @profile = User.find(params[:id])
    if @user != @profile
      redirect_to profile_path(@user)
    end
  end

  def update
    @user = current_user
    @user.avatar = params["/profiles/#{@user.id}"][:avatar]
    @user.save

    redirect_to profile_path(@user)
  end

end
