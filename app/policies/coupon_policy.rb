class CouponPolicy < ApplicationPolicy
  def index?
    admin
  end

  def new?
    create?
  end

  def create?
    admin
  end
end
