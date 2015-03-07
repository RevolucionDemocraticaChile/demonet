task cleandb: :environment do
  AdminGroup.all.each do |ag|

    puts "scanning users"
    if User.find_by(id: ag.user_id).present?
      puts "present"
    else
      puts "not present"
    end

    puts "scanning groups"
    if Group.find_by(id: ag.group_id).present?
      puts "present"
    else
      puts "not present"
      # ag.destroy
    end

  end
end
