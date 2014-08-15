class Territorio < ActiveRecord::Base
	NAME_MAX_LENGTH = 100

	has_many :member_territorios
	has_many :members, class_name: "User", through: :member_territorios

	has_many :admin_territorios
	has_many :admins, class_name: "User", through: :admin_territorios

	has_many :actas

	validates :name, presence: true,
	                 length:   { maximum: NAME_MAX_LENGTH },
									 uniqueness: { case_sensitive: false }
end
