class UserMailer < ActionMailer::Base
  default from: "plataforma@revoluciondemocractica.cl"

  def welcome_email(user, password)
    # @url = ENV['APP_NAME']
    @url = "http://plataforma.revoluciondemocratica.cl"
    @password = password
    @user = user
    mail to: user.email, subject: "Contraseña para demonet"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Reseteo de contraseña"
  end
end
