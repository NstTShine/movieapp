class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    else user.member?
      can [:create, :update], RatingMovie
      can [:create, :update, :destroy], Comment
      can [:edit, :update], User
    end
  end
end
