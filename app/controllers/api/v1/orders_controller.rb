class Api::V1::OrdersController < ApplicationController

  def add_to_cart
    user = User.find(params[:user_id])
    book = Book.find(params[:book_id])
    order = user.orders.find_by(status: "pended")

    if order
      # if order.books.find_by(id: params[:book_id])
        # book.update(quantity: book.quantity+1)
        # order.books.where(id: 1).count
      # else
        order.books << book
      # end
    else
      user.orders.create
      order.books << book
    end

    render json: {
      message: '加入訂單成功！',
      params: params
    }
  end

  def remove_to_cart
    order = Order.find(params[:id])
    order.book_orders.find_by(book_id: params[:book_id]).destroy

    render json: {
      message: '移除訂單成功！',
      params: params
    }
  end

  def select_coupon
    order = Order.find(params[:id])
    coupon = Coupon.find(params[:coupon_id])
    origin_amount = order.books.pluck(:price).sum
    amount = order.price_calculation(coupon.discount_method, origin_amount)
    order.update(amount: amount, coupon_id: params[:coupon_id])

    render json: {
      message: "折價卷選擇成功",
      coupon: coupon,
      amount: amount,
    }
  end
end