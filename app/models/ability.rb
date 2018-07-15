class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :create, Poem, :user_id => user.id
      can :read, Poem, :user_id => user.id
      can :update, Poem, :user_id => user.id
      can :destroy, Poem, :user_id => user.id

      can :create, Category
      can :update, Category, :user_id => user.id
      can :read, Category, :user_id => user.id
      can :destroy, Category, :user_id => user.id
    else
    end
  end
end
