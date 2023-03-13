class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

end
