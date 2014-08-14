class AdminTerritorio < ActiveRecord::Base
	belongs_to :admin, foreign_key: "user_id", class_name: "User"
	belongs_to :aterritorio, foreign_key: "territorio_id", class_name: "Territorio"
end
