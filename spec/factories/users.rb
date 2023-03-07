FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    last_name             {"全角"}
    first_name            {"全角"}
    kana_last_name        {"ゼンカクカナ"}
    kana_first_name       {"ゼンカクカナ"}
    birthday              {Faker::Date.between(from: '1930-01-1', to: '2018-12-31')}
  end
end