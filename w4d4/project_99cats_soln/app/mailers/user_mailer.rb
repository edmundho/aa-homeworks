class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = 'http://appacademy.io'
    mail(to: user.username, subject: 'Welcome to a/A')

  end
end
