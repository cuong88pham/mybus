class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      # user.permissions.each do |permission|
      #   begin
      #     can permission.action.to_sym, permission.subject_class.constantize
      #   rescue
      #     can permission.action.to_sym, permission.subject_class
      #   end
      # end
    end
  end

end
