module ApplicationHelper

  def small_avatar_for(user)
    options = if user.display_name.present?
      {
        alt: format_user_name(user),
        class: "gravatar img-circle",
        size: UsersHelper::GRAVATAR_DEFAULT_SIZE_SMALL,
        style: "width: 30px;",
        title: user.full_name,
        data: { toggle: 'tooltip', placement: 'top' },
      }
    else
      {
        alt: format_user_name(user),
        class: "gravatar img-circle",
        size: UsersHelper::GRAVATAR_DEFAULT_SIZE_SMALL,
        style: "width: 30px;"
      }
    end
    image_tag(gravatar_url_for(user), options)
  end

  def format_meeting_name(meeting)
    "#{t(:meeting).humanize} #{(meeting.groups.map { |g| g.display_name }).join(', ')} #{l meeting.date}"
  end

  def format_user_name(user)
    if user.display_name
      user.display_name.titleize
    else
      user.full_name
    end
  end

  def format_payment_name(payment)
    "Pago #{payment.id}"
  end

  def format_group_name(group)
    group.display_name
  end

  def format_group_type(group)
    case group.type
    when "Territory"
      "Territorio"
    when "Comission"
      "Comisión"
    when "Front"
      "Frente"
    when "Executive"
      "Ejecutivo"
    when "Directive"
      "Directiva"
    when "congressional_office"
      "Diputación"
    else
      "Desconocido"
    end
  end

  def options_for_group_type
    [
      [t(:territory).humanize,            "Territory"],
      [t(:comission).humanize,            "Comission"],
      [t(:front).humanize,                "Front"],
      [t(:executive).humanize,            "Executive"],
      [t(:directive).humanize,            "Directive"],
      [t(:congressional_office).humanize, "congressional_office"],
      [t(:others).humanize,               "Others"]
    ]
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
