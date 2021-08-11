FactoryBot.define do
  factory :item do
    item_name     {Faker::Name.unique.name}
    description   {Faker::Lorem.sentence}
    category_id   {Faker::Number.within(range: 2..11)}
    condition_id  {Faker::Number.within(range: 2..7)}
    charges_id    {Faker::Number.within(range: 2..3)}
    source_id     {Faker::Number.within(range: 2..48)}
    days_id       {Faker::Number.within(range: 2..4)}
    price         {Faker::Number.within(range: 300..9999999)}
  end
end
