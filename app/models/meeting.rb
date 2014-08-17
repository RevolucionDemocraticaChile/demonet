class Meeting < ActiveRecord::Base

	belongs_to :territory

	has_many :user_meetings
	has_many :users, through: :user_meetings

end
