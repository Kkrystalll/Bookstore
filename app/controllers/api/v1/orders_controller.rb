class Api::V1::OrdersController < ApplicationController

  def add_to_cart
    user = User.find(params[:user_id])
    book = Book.find(params[:book_id])
    order = user.orders.find_by(status: "pended")

    if order
      order.books << book
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
end