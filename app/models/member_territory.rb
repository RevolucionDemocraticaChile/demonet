# == Schema Information
#
# Table name: member_territories
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  territory_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class MemberTerritory < ActiveRecord::Base
  belongs_to :member, foreign_key: "user_id", class_name: "User"
  belongs_to :territory
end
