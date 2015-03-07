task cleandb: :environment do
  AdminGroup.all.each do |ag|

    if !User.find_by(id: ag.user_id).present?
      puts ag.inspect
      puts " user not present"
    end

    if !Group.find_by(id: ag.group_id).present?
      puts ag.inspect
      puts " group not present"
    end

  end
end
