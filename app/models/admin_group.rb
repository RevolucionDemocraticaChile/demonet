# == Schema Information
#
# Table name: admin_groups
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class AdminGroup < ActiveRecord::Base

  belongs_to :user
  belongs_to :group

  validates :user,
    presence: true

  validates :group,
    presence: true

  validates :user_id, :uniqueness => { :scope => :group_id }

end
