class UserMailer < ActionMailer::Base
  default from: "admin@demonet.cl"

  def welcome_email(user, password)
    @url = 'demonet.herokuapp.com'
    @password = password
    @user = user
    mail to: user.email, subject: "Contraseña para demonet"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Reseteo de contraseña"
  end
end
