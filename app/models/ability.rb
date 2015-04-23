class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # User
    can [:list, :show],   User
    can [:edit, :update], User, id: user.id

    if user.moderator?
      can [:new, :create], User
      can [:edit, :update], User
    end

    # users#index is getting way to heavy. Only admins should access:
    if user.admin?
      can :index, User
    end

    # Group
    can :index, Group
    can :show,  Group
    can [:edit, :update, :destroy], Group do |group|
      user.agroups.include?(group)
    end

    # Meeting
    can [:list, :show], Meeting

    if user.moderator?
      can [:index, :new, :create], Meeting
    end

    can [:edit, :update, :destroy], Meeting do |meeting|
      ans = false
      user.agroups.each do |group|
        if meeting.groups.include?(group)
          ans = true
        end
      end
      ans
    end


    # Payment
    if user.has_role? :finance_manager
      can :manage, Payment
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
