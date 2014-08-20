# == Schema Information
#
# Table name: member_groups
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class MemberGroup < ActiveRecord::Base

  belongs_to :member, class_name: "User"
  belongs_to :group

end
