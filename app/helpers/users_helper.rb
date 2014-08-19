module UsersHelper

  def gravatar_for(user, size = 100)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar img-circle")
  end

  def recent_attendance_for(user)
    user.meetings.where(date: (DateTime.now-6.months)..(DateTime.now)).count
  end
  
  def is_active(user)
    recent_attendance_for(user) >= 6
  end

end
