class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :item_name, length: {maximum: 40}
    validates :description, length: {maximum: 1000}
    validates :price, inclusion: { in: 300..9999999, message: 'is out of setting range' }, numericality: { message: 'is invalid. Input half-width characters' }
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :choice1
  belongs_to :choice2
  belongs_to :choice3
  belongs_to :choice4
  belongs_to :choice5

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id 
    validates :condition_id
    validates :charges_id
    validates :source_id
    validates :days_id
  end

end
