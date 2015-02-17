module ApplicationHelper

  def format_meeting_name(meeting)
    "#{t(:meeting).humanize} #{(meeting.groups.map { |g| g.name }).join(', ')} #{l(Date.parse(meeting.date.to_s))}"
  end

  # def format_group_names(groups)
  #   groups.join(',')
  # end

  def min_recent
    User::MIN_RECENT_ATTENDANCES_FOR_ACTIVE_MEMBERSHIP
  end

  def recent_time_months
    User::RECENT_TIME_MONTHS
  end

  def demonet_version
    Demonet::Application::DEMONET_VERSION
  end

end
