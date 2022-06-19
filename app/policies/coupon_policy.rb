class CouponPolicy < ApplicationPolicy
  def index?
    seller || admin
  end

  def new?
    create?
  end

  def create?
    seller || admin
  end
end