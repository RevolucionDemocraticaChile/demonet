module ApplicationHelper

  def format_meeting_name(meeting)
    "#{t(:meeting).humanize} #{(meeting.groups.map { |g| g.name }).join(', ')} #{l(Date.parse(meeting.date.to_s))}"
  end

  # def format_group_names(groups)
  #   groups.join(',')
  # end

  MIN_RECENT_ATTENDANCES_FOR_ACTIVE_MEMBERSHIP = 6

end
