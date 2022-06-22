class OrdersController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!, only: [:index]

  def index
    @order = current_user.orders.find_by(status: "pended")
    order_information = @order.books.group(:title, :id, :price).count
    # @current_order = @order.order_content(order_information)
    
    @current_order = order_information.each_with_object([]) do |element,arr|
      book, count = element
      arr.push({title: book.first, id: book.second, price: book.last, count: count})
    end

    @books = @order.books
    @amount = @books.pluck(:price).sum
    @order.update(amount: @amount)
    @coupons = Coupon.all
    
    @form_info = Newebpay::Mpg.new(@order).form_info
  end

  def show
    
  end

  def return_response
    response = Newebpay::Mpgresponse.new(params[:TradeInfo])
    order= Order.find(response.result["MerchantOrderNo"])

    if response.status === 'SUCCESS'
      order.pay!
      redirect_to root_path, notice: "付款成功"
    else
      redirect_to orders_path, alert: '付款失敗'
    end
  end
end