# == Schema Information
#
# Table name: admin_territories
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  territory_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class AdminTerritory < ActiveRecord::Base

  belongs_to :admin, foreign_key: "user_id", class_name: "User"
  belongs_to :aterritory, foreign_key: "territory_id", class_name: "Territory"

end
