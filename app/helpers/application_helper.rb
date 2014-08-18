module ApplicationHelper

	def format_meeting_name(meeting)
		"Meeting #{meeting.group.name} #{l(Date.parse(meeting.date.to_s))}"
	end

end
