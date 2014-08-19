module UsersHelper

  GRAVATAR_DEFAULT_SIZE = 100
  LOGO_RD_SMALL_URL = "https://s3.amazonaws.com/demonet/Logo_RD_small.png"

  def gravatar_for(user, size = GRAVATAR_DEFAULT_SIZE)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{u(LOGO_RD_SMALL_URL)}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar img-circle", size: "#{GRAVATAR_DEFAULT_SIZE}")
  end

  def recent_attendance_for(user)
    user.meetings.where(date: (DateTime.now-6.months)..(DateTime.now)).count
  end

end
