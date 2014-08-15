class Acta < ActiveRecord::Base

	belongs_to :territorio

	has_many :user_actas
	has_many :users, through: :user_actas

	# def name
	# 	"Acta #{territorio.name} #{l Date.parse(date.to_s)}"
	# end

end
