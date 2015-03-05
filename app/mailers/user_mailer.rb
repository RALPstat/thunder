 class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  #require 'byebug'

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000"
    mail(to: @user.email, subject: 'Bienvenido a Thunder')     
  end

  def like_email(user, friend)
    @user = user
    @friend = friend
    #byebug
    mail(to: [@user.email, @friend.email], subject: 'Ha habido un Match')     
  end

end
