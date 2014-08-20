# == Schema Information
#
# Table name: user_meetings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  meeting_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserMeeting < ActiveRecord::Base

  belongs_to :user
  belongs_to :meeting

  validates :user,
    presence: true

  validates :meeting,
    presence: true

  validates :user_id, :uniqueness => { :scope => :meeting_id }

end
