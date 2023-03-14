class OrderOrderInfo
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :manicipalities, :address, :building, :phone_number, :order_id, :item_id, :user_id,
                :token

  validates :token, presence: true
  validates :post_code, presence: true,
                        format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :manicipalities
    validates :address
  end
  validates :phone_number, presence: true, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is too short' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    OrderInfo.create(post_code: post_code, prefecture_id: prefecture_id, manicipalities: manicipalities, address: address,
                     building: building, phone_number: phone_number, order_id: order.id)
  end
end
