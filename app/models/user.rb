# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean
#

class User < ActiveRecord::Base
  USERNAME_MAX_LENGTH = 50
  EMAIL_MAX_LENGTH    = 50
  NAME_MAX_LENGTH     = 50
  PASSWORD_MIN_LENGTH = 6
  VALID_EMAIL_REGEX   = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :member_groups, foreign_key: "member_id"
  has_many :groups, foreign_key: "member_id", through: :member_groups

  has_many :admin_groups
  has_many :agroups, foreign_key: "admin_id", through: :admin_groups

  has_many :user_meetings
  has_many :meetings, through: :user_meetings

  validates :username,
    presence:   true,
    uniqueness: { case_sensitive: false },
    length:     { maximum: USERNAME_MAX_LENGTH }

  validates :email,
    presence:   true,
    uniqueness: { case_sensitive: false },
    length:     { maximum: EMAIL_MAX_LENGTH },
    format:     { with: VALID_EMAIL_REGEX   }

  validates :name,
    presence:   true,
    length:     { maximum: NAME_MAX_LENGTH }

  validates :password,
    length:     { minimum: PASSWORD_MIN_LENGTH }

  # Hooks:

  before_create :create_remember_token

  before_save do
    self.username = username.downcase
    self.email    = email.downcase
  end

  has_secure_password

  def admin?
    admin
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

end
