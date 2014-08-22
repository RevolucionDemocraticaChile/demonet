class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :index, User
    can :show,  User
    can :edit,  User, id: user.id

    can :index, Group
    can :show,  Group
    can :edit,  Group do |group|
      user.agroups.include?(group)
    end

    # Meetings

    can :index, Meeting
    can :show,  Meeting

    can [:new, :create], Meeting do |meeting|
      user.agroups.any?
    end

    can :edit,  Meeting do |meeting|
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
      can? :edit, meeting_group.meeting && group.admins.include?(user)
    end

    if user.admin?
      can :manage, :all
    end


    # UserMeetings

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

end
