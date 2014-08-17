module ApplicationHelper

	def format_meeting_name(meeting)
		"Meeting #{meeting.territorio.name} #{l(Date.parse(meeting.date.to_s))}"
	end

end
