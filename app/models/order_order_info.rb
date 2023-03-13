class OrderOrderInfo

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :manicipalities, :address, :building, :phone_number, :order_id, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code
    validates :prefecture_id
    validates :manicipalities
    validates :address, presence: true
    validates :phone_number
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    OrderInfo.create(post_code: post_code, prefecture_id: prefecture_id, manicipalities: manicipalities, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end


end