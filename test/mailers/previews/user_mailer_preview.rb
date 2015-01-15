class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    user = User.first
    UserMailer.welcome_email(user, 'superpassword')
  end

  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end
end
