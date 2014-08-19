module ApplicationHelper

  def format_meeting_name(meeting)
    "#{t(:meeting).humanize} #{meeting.group.name} #{l(Date.parse(meeting.date.to_s))}"
  end

end
