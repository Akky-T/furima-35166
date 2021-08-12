FactoryBot.define do
  factory :item do
    image                       { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/test.png')) }
    item_name                   { Faker::Name.unique.name }
    description                 { Faker::Lorem.sentence }
    category_id                 { Faker::Number.within(range: 2..11) }
    condition_id                { Faker::Number.within(range: 2..7) }
    charge_id                   { Faker::Number.within(range: 2..3) }
    source_id                   { Faker::Number.within(range: 2..48) }
    scheduled_delivery_id       { Faker::Number.within(range: 2..4) }
    price                       { Faker::Number.within(range: 300..9_999_999) }
    association :user
  end
end