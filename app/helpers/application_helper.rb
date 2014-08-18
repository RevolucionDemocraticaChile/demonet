module ApplicationHelper

  def format_meeting_name(meeting)
    "Acta #{meeting.territory.name} #{l(Date.parse(meeting.date.to_s))}"
  end

end
