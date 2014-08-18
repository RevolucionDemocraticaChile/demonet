class AdminTerritory < ActiveRecord::Base

	belongs_to :admin, foreign_key: "user_id", class_name: "User"
	belongs_to :aterritory, foreign_key: "territory_id", class_name: "Territory"

end
