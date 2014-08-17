class Espacio < ActiveRecord::Base

	validates :name, presence: true
	validates :desc, presence: true
	validates :state, presence: true

end
