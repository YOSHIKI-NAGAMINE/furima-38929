class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    
  end

private

  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, :price, :image)
  end

end
