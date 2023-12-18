class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new # guest user (not logged in)
    
    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'owner'
      can :read, User
      can :manage, Car
      can :manage, User, id: user.id
      cannot :manage, AdminUser
    end
  end
end
