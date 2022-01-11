# frozen_string_literal: true

class Ability
  include CanCan::Ability

   def initialize(user)
    if user.admin_role?
      can :manage, :all
    else
      can :read, :all
    end
  end
end
