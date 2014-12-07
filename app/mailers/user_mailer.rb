class UserMailer < ActionMailer::Base

  default from: 'test@example.com'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject:"Test")
  end
end