class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, inclusion: { in: 300..9_999_999, message: 'is out of setting range' },
                      numericality: { message: 'is invalid. Input half-width characters' }
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :source
  belongs_to :scheduled_delivery

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :source_id
    validates :scheduled_delivery_id
  end
end
