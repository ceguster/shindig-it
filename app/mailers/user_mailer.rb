class UserMailer < ActionMailer::Base

  default from: 'canyoudigit@shindigit.com'

  def welcome_email(user)
    @user = user
    @url = 'shindigit.herokuapp.com'
    mail(to: user.email, subject:"Welcome to ShindigIt!")
  end

  def invitation_email(user)
    @user = user
    @url = 'shindigit.herokuapp.com'
    mail(to: user.email, subject: "You've been invited!")
  end
end