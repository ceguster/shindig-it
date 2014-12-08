class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update
    @user = current_user
    binding.pry
    @image = params["/profiles/#{@user.id}"][:image]
    @user.image = @image.original_filename
    @user.avatar = @image
    @user.save

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