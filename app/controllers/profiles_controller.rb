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
# u = User.new
# u.avatar = params[:file] # Assign a file like this, or
# u.avatar = File.open('somewhere') # like this
# u.save!
# u.avatar.url # => '/url/to/file.png'
# u.avatar.current_path # => 'path/to/file.png'
# u.avatar.identifier # => 'file.png'

# file = File.open('example.jpg')
# uploader = MyUploader.new
# uploader.store!(file)