class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :condition_id
    validates :charges_id
    validates :source_id
    validates :days_id
    validates :price
  end
end
