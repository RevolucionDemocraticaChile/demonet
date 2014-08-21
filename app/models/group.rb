# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :string(255)
#  type       :string(255)
#  state      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  # Don't use the type column for inheritance
  self.inheritance_column = nil

  NAME_MAX_LENGTH = 200
  DESC_MAX_LENGTH = 10000

  has_many :meeting_groups
  has_many :meetings, through: :meeting_groups

  has_many :admin_groups
  has_many :admins, through: :admin_groups

  has_many :member_groups
  has_many :members, through: :member_groups, source: :user

  validates :name,
    presence: true,
    length:   { maximum: NAME_MAX_LENGTH }

  validates :desc,
    # presence: true,
    length:   { maximum: DESC_MAX_LENGTH }

  # validates :state,
  #   presence: true

  # before_create { self.state = "created" }

end
