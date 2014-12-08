class UserMailer < ActionMailer::Base

  default from: 'canyoudigit@shindigit.com'

  def welcome_email(user)
    @user = user
    @url = 'shindigit.herokuapp.com'
    mail(to: user.email, subject:"Welcome to ShindigIt!")
  end

  def invitation_email(user_email, event, host)
    @user_email = user_email
    @user = User.find_by(:email => user_email)
    @event = event
    @host = host
    @url = 'shindigit.herokuapp.com'
    mail(to: user_email, subject: "You've been invited!")
  end
end