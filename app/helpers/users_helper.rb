module UsersHelper

  GRAVATAR_DEFAULT_SIZE = 100
  GRAVATAR_DEFAULT_SIZE_SMALL = 10

  LOGO_RD_SMALL_URL = "https://raw.githubusercontent.com/RevolucionDemocraticaChile/demonet/development/app/assets/images/Logo_RD_small.png"
  RD_FACES_BW_URL = "https://raw.githubusercontent.com/RevolucionDemocraticaChile/demonet/development/app/assets/images/rd_faces.bw-trans.png"

  def gravatar_for(user, size = GRAVATAR_DEFAULT_SIZE)
    image_tag(gravatar_url_for(user), alt: user.name, class: "gravatar img-circle", size: "#{size}")
  end

  def gravatar_url_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{GRAVATAR_DEFAULT_SIZE}&d=#{u(RD_FACES_BW_URL)}"
  end

  def recent_attendance_for(user)
    user.meetings.where(date: (DateTime.now-6.months)..(DateTime.now)).count
  end

end
