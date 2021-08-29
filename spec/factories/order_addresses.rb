FactoryBot.define do
  factory :order_address do
    post_code     { '123-4567' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city          { Gimei.city.kanji }
    block_number  { Gimei.town.kanji }
    building_name { Faker::Address.building_number }
    phone_number  { Faker::Number.number(digits: 10) }
    token         { "tok_abcdefghijk00000000000000000" }
  end
end



