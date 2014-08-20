# == Schema Information
#
# Table name: admin_groups
#
#  id         :integer          not null, primary key
#  admin_id   :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class AdminGroup < ActiveRecord::Base

  belongs_to :admin, class_name: "User"
  belongs_to :group

end
