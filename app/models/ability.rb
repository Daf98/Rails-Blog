class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :manage, Post, author: user
    can :manage, Comment, author: user
  end
end
