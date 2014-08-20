# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  date       :date
#  desc       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Meeting < ActiveRecord::Base

  has_many :user_meetings
  has_many :users, through: :user_meetings

  has_many :meeting_groups
  has_many :groups, through: :meeting_groups

  # validates :group,
  #   presence: true

end
