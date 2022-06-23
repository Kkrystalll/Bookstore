class BookPolicy < ApplicationPolicy
  def index?
    buyer || admin
  end

  def new?
    create?
  end

  def create?
    admin
  end

  def edit?
    update?
  end

  def update?
    admin
  end

  def destroy?
    admin
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
