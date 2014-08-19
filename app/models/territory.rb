# == Schema Information
#
# Table name: territories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Territory < Group

  NAME_MAX_LENGTH = 100

  has_many :member_territories
  has_many :members, class_name: "User", through: :member_territories

  has_many :admin_territories
  has_many :admins, class_name: "User", through: :admin_territories

  has_many :meetings, foreign_key: "group_id"

  validates :name,
    presence: true,
    length:     { maximum: NAME_MAX_LENGTH },
    uniqueness: { case_sensitive: false }

end
