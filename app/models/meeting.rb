# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  date       :datetime
#  desc       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Meeting < ActiveRecord::Base

  belongs_to :group

  has_many :user_meetings
  has_many :users, through: :user_meetings

  validates :group,
    presence: true

end
