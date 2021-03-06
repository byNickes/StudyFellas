class Ability
  include CanCan::Ability

  def initialize(user)
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
    
    if user.is_admin?
      can :manage, :all

    elsif user.is_user?
      can [:kick_user, :accept, :refuse, :index_requests,:delete_group, :update, :edit, :destroy], Group, leader_id: user.id
      can [:show], Group do |group|
        group.belongings.where(:user_id => user.id, :group_id => group.id).empty?
      end
      can [:edit, :update, :delete_profile_picture], Profile, user_id: user.id
    end

  end
end
