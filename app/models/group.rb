class Group < ActiveRecord::Base

	NAME_MAX_LENGTH = 200
	DESC_MAX_LENGTH = 10000

	validates :name,  presence: true
	validates :name,  length:   { maximum: NAME_MAX_LENGTH }
	validates :desc,  length:   { maximum: DESC_MAX_LENGTH }
	validates :state, presence: true

end
