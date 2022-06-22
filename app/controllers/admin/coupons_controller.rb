class Admin::CouponsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @coupons = Coupon.all
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)

    if @coupon.save
      redirect_to admin_coupons_path, notice: "折價卷新增成功"
    else
      render :new
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy
    redirect_to admin_coupons_path, alert: "刪除成功"
  end

  private
  def coupon_params
    params.require(:coupon).permit(:title, :start_date, :expiry_date, :discount_method, :piece)
  end

end