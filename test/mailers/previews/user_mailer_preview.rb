class UserMailerPreview < ActionMailer::Preview
  def password_reset
    user = User.first
    user.reset_token = User.new_remember_token
    UserMailer.password_reset(user)
  end
end
