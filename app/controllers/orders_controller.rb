class OrdersController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!, only: [:index]

  def index
    @order = current_user.order
    @books = @order.books
    @amount = @books.pluck(:price).sum
    @order.update(amount: @amount)
    @coupons = Coupon.all
    
    @form_info = Newebpay::Mpg.new(@order).form_info
  end

  def show
    
  end

  def return_response
    redirect_to root_path, notice: "付款成功"
  end
end