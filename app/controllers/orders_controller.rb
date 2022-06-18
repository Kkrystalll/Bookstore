class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:show]

  def show
    # payment = Newebpay::Payment.new(
    #       order_number: Order.find(params[:id]),
    #       amount: 100)

    # @form_info = payment.required_parameters # { MERCHANT_ID:..., TradeInfo: ..., TradeSha: ..., Version: '2.0' }

    # render json: @form_info


    # @order = Order.find(params[:id])
    # @form_info = Newebpay::Mpg.new(@order).form_info
    # @MerchantID = @form_info[:MerchantID]
    # @TradeInfo = @form_info[:TradeInfo]
    # @TradeSha = @form_info[:TradeSha]
    # @Version = @form_info[:Version]
  end
end