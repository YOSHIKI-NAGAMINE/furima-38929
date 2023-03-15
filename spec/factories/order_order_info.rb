FactoryBot.define do
  factory :order_order_info do
    token { '1111111111' }
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    manicipalities { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09000000000' }
  end
end
