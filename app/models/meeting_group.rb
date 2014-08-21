# == Schema Information
#
# Table name: meeting_groups
#
#  id         :integer          not null, primary key
#  meeting_id :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class MeetingGroup < ActiveRecord::Base

  belongs_to :meeting
  belongs_to :group

  validates :meeting,
    presence: true

  validates :group,
    presence: true

  validates :meeting_id, :uniqueness => { :scope => :group_id }

end
