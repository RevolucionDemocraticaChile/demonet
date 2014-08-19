module UsersHelper

  GRAVATAR_DEFAULT_SIZE = 100

  def gravatar_for(user, size = GRAVATAR_DEFAULT_SIZE)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar img-circle", size: "#{GRAVATAR_DEFAULT_SIZE}")
  end

  def recent_attendance_for(user)
    user.meetings.where(date: (DateTime.now-6.months)..(DateTime.now)).count
  end

end
