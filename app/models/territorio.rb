class Territorio < ActiveRecord::Base
	NAME_MAX_LENGTH = 100

	validates :name, presence: true,
	                 length:   { maximum: NAME_MAX_LENGTH },
									 uniqueness: { case_sensitive: false }
end
