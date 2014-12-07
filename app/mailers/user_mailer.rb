class UserMailer < ActionMailer::Base

  default from: 'flatiron.shindigit@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject:"Test")
  end
end