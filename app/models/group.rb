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

  STRING_MAX_LENGTH = 200
  DESC_MAX_LENGTH = 10000

  has_many :meeting_groups
  has_many :meetings, through: :meeting_groups

  has_many :admin_groups, dependent: :destroy
  has_many :admins, through: :admin_groups, source: :user

  has_many :member_groups, dependent: :destroy
  has_many :members, through: :member_groups, source: :user

  validates :name,
    presence: true,
    length:   { maximum: STRING_MAX_LENGTH }

  validates :desc,
    length:   { maximum: DESC_MAX_LENGTH }

  validates :type,
    length:   { maximum: STRING_MAX_LENGTH }

  def display_name
    case type
    when "Territory"
      "Territorio #{name}"
    when "Comission"
      "Comisión #{name}"
    when "Front"
      "Frente #{name}"
    else
      name
    end
  end

end
