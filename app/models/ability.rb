# app/models/ability.rb

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.owner?
      can [:read, :create, :update], Car
      can :destroy, Car, approved: false
    else
      can :read, Car, approved: true
      # Other permissions for regular users
    end
  end
end
