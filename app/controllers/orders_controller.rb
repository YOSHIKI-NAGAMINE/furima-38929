class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    @order_order_info = OrderOrderInfo.new
    if @item.user_id == current_user.id
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_order_info = OrderOrderInfo.new(order_params)
    if @order_order_info.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_order_info.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_order_info).permit(:post_code, :prefecture_id, :manicipalities, :address, :building,
                                             :phone_number).merge(user_id: current_user.id).merge(token: params[:token]).merge(item_id: params[:item_id])
  end
end
