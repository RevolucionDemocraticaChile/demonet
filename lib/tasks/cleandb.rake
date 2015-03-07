task cleandb: :environment do
  AdminGroup.all.each do |ag|

    if User.find_by(id: ag.user_id).present?
      puts "present"
    else
      puts "not present"
    end

    if Group.find_by(id: ag.group_id).present?
      puts "present"
    else
      puts "not present"
      ag.destroy
    end

  end
end
