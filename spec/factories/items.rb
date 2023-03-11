FactoryBot.define do
  factory :item do
    name                    {Faker::Name.name}
    explain                 {Faker::Lorem.paragraph}
    category_id             {Faker::Number.between(from: 2, to: 11)}
    condition_id            {Faker::Number.between(from: 2, to: 7)}
    shipping_charge_id      {Faker::Number.between(from: 2, to: 3)}
    prefecture_id           {Faker::Number.between(from: 2, to: 48)}
    shipping_day_id         {Faker::Number.between(from: 2, to: 4)}
    price                   {Faker::Number.between(from: 300, to: 9999999)}
  end
end