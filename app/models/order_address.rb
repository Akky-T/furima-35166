class OrderAddress
  include ActiveModel::Model
  attr_accessor :price, :user_id, :item_id, :post_code, :prefecture_id, :city, :block_number, :building_name, :phone_number, :order_id

  with_options presence: true do
    validates :price, inclusion: { in: 300..9_999_999, message: 'is out of setting range' },
                      numericality: { message: 'is invalid. Input half-width characters' }
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :block_number
    validates :phone_number, format: {with: /\A[0-9]\z/, message: "is invalid. Input only number"},
                             length: { in: 10..11, message: "is too short" }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

end