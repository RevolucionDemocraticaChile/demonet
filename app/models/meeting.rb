# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  date       :date
#  desc       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  state      :string(255)
#  minutes    :string(255)
#  place      :string(255)
#  title      :string(255)
#  start      :datetime
#  finish     :datetime
#

class Meeting < ActiveRecord::Base

  has_many :user_meetings
  has_many :users, through: :user_meetings

  has_many :meeting_groups
  has_many :groups, through: :meeting_groups

  # validates :group,
  #   presence: true

end
