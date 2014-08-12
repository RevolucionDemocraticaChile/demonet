class User < ActiveRecord::Base
	USERNAME_MAX_LENGTH = 50
	EMAIL_MAX_LENGTH    = 50
	NAME_MAX_LENGTH     = 50
	PASSWORD_MIN_LENGTH = 6
	VALID_EMAIL_REGEX   = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :username, presence:   true,
                       uniqueness: { case_sensitive: false },
	                     length:     { maximum: USERNAME_MAX_LENGTH }
	validates :email,    presence:   true,
                       uniqueness: { case_sensitive: false },
	                     length:     { maximum: EMAIL_MAX_LENGTH },
	                     format:     { with: VALID_EMAIL_REGEX   }
	validates :name,     presence:   true,
	                     length:     { maximum: NAME_MAX_LENGTH }
	validates :password, length:     { minimum: PASSWORD_MIN_LENGTH }

  # Hooks:

	before_save do
		self.username = username.downcase
		self.email    = email.downcase
	end

	has_secure_password

end
