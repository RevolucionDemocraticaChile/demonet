class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :index, User
    can :show,  User
    can [:edit, :update],  User, id: user.id

    can :index, Group
    can :show,  Group
    can [:edit, :update, :destroy], Group do |group|
      user.agroups.include?(group)
    end

    # Meetings
    can :index, Meeting
    can :show,  Meeting

    if user.agroups.any?
      can [:new, :create], Meeting
    end

    can [:edit, :update, :destroy],  Meeting do |meeting|
      ans = false
      user.agroups.each do |group|
        if meeting.groups.include?(group)
          ans = true
        end
      end
      ans
    end


    # MeetingGroups
    can :create, MeetingGroup do |meeting_group|
      can? :edit, meeting_group.meeting
    end

    can :destroy, MeetingGroup do |meeting_group|
      meeting = meeting_group.meeting
      group   = meeting_group.group
      can?(:edit, meeting) && group.admins.include?(user)
    end

    # Admin
    if user.admin?
      can :manage, :all
    end
  end

end
