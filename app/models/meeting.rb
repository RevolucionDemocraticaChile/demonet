class Meeting < ActiveRecord::Base

	belongs_to :territorio

	has_many :user_meetings
	has_many :users, through: :user_meetings

end
