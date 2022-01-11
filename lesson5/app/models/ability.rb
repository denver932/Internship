# frozen_string_literal: true

class Ability
  include CanCan::Ability

   def initialize(user)
      if user.basic_role?
        can :read, :all
        can :manage, Appointment
      elsif user.admin_role?
        can :manage, :all
      else
        can :read, :all
     end
  end
end
