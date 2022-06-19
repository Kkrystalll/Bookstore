class BookPolicy < ApplicationPolicy
  def index?
    buyer || seller || admin
  end

  def new?
    create?
  end

  def create?
    seller || admin
  end

  def edit?
    update?
  end

  def update?
    seller || admin
  end

  def destroy?
    seller || admin
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end