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

  NAME_MAX_LENGTH = 200
  DESC_MAX_LENGTH = 10000

  validates :name,
    presence: true,
    length:   { maximum: NAME_MAX_LENGTH }

  validates :desc,
    # presence: true,
    length:   { maximum: DESC_MAX_LENGTH }

  # validates :state,
  #   presence: true

  before_create { self.state = "created" }

end
