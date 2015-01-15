# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean
#  first_name      :string(255)
#  second_name     :string(255)
#  last_name       :string(255)
#  rut             :string(255)

class User < ActiveRecord::Base
  include RunCl::ActAsRun
  attr_accessor :remember_token, :reset_token

  EMAIL_MAX_LENGTH       = 50
  FIRSTNAME_MAX_LENGTH  = 50
  SECONDNAME_MAX_LENGTH = 50
  LASTNAME_MAX_LENGTH   = 50
  PASSWORD_MIN_LENGTH    = 6
  VALID_EMAIL_REGEX      = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :member_groups
  has_many :groups, through: :member_groups

  has_many :admin_groups
  has_many :agroups, through: :admin_groups, source: :group

  has_many :user_meetings
  has_many :meetings, through: :user_meetings

  validates :email,
    presence:   true,
    uniqueness: { case_sensitive: false },
    length:     { maximum: EMAIL_MAX_LENGTH },
    format:     { with: VALID_EMAIL_REGEX   }

  validates :first_name,
    presence:   true,
    length:     { maximum: FIRSTNAME_MAX_LENGTH }

  validates :second_name,
    presence:   true,
    length:     { maximum: SECONDNAME_MAX_LENGTH}

  validates :last_name,
    presence:   true,
    length:     { maximum: LASTNAME_MAX_LENGTH }

  validates :password,
    presence:   true,
    length:     { minimum: PASSWORD_MIN_LENGTH }

  has_run_cl :rut, uniq_run: true, run: true

  # Hooks:

  before_save do
    self.email    = email.downcase
    self.rut      = Run.format(rut)
  end

  has_secure_password

  def admin?
    admin
  end

  def remember
    self.remember_token = User.digest( User.new_token )
    update_column(:remember_token, remember_token)
  end

  def forget
    update_column(:remember_token, nil)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(token, cost: cost)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def authenticated?(token)
    return false if remember_token.nil?
    BCrypt::Password.new(remember_token).is_password?(token)
  end

  def authenticated_reset?(token)
    return false if reset_digest.nil?
    BCrypt::Password.new(reset_digest).is_password?(token)
  end

end
