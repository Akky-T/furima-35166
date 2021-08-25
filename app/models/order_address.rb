class OrderAddress
  include ActiveModel::Model
  attr_accessor :price, :user_id, :item_id, :post_code, :prefecture_id, :city, :block_number, :building_name, :phone_number, :order_id, :token

  with_options presence: true do
    validates :price, inclusion: { in: 300..9_999_999, message: 'is out of setting range' },
                      numericality: { message: 'is invalid. Input half-width characters' }
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :block_number
    validates :phone_number, format: {with: /\A[0-9]\z/, message: "is invalid. Input only number"},
                             length: { in: 10..11, message: "is too short" }
    validates :order_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(price: price, user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end