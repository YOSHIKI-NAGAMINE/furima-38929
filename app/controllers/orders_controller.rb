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
    @item = Item.find(params[:item_id])
    @order_order_info = OrderOrderInfo.new(donation_params)
    if @order_order_info.valid?
      @order_order_info.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def donation_params
    params.permit(:item_id, :post_code, :prefecture_id, :manicipalities, :address, :building, :phone_number).merge(user_id: current_user.id)
  end

end
