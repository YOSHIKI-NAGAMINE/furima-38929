class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    if @item.user_id == current_user.id
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @order_info = OrderInfo.new(order_info_params)
    @order_info.save
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def order_info_params
    params.permit(:post_code, :prefecture_id, :manicipalities, :address, :building, :phone_number).merge(order_id: @order.id)
  end

end
