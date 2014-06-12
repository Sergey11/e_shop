class UserMailer < ActionMailer::Base
  default from: "notifications@example.com"

  def welcome_email(user)
    @user = user
    @url  = 'svidlo.sv@gmail.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def fogot_password(user, token)
    @user = user
    @token = token
    @url  = 'svidlo.sv@gmail.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
