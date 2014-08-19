module UsersHelper

  GRAVATAR_DEFAULT_SIZE = 100
  LOGO_RD_SMALL_URL = "https://raw.githubusercontent.com/RevolucionDemocraticaChile/demonet/development/app/assets/images/Logo_RD_small.png"
  RD_FACES_BW_URL = "https://raw.githubusercontent.com/RevolucionDemocraticaChile/demonet/development/app/assets/images/rd_faces.bw-trans.png"

  def gravatar_for(user, size = GRAVATAR_DEFAULT_SIZE)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{u(RD_FACES_BW_URL)}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar img-circle", size: "#{size}")
  end

  def recent_attendance_for(user)
    user.meetings.where(date: (DateTime.now-6.months)..(DateTime.now)).count
  end

end
