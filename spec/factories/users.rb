FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '全角' }
    last_name             { '全角' }
    first_name_kana       { 'カタカナ' }
    last_name_kana        { 'カタカナ' }
    birthday              { Faker::Date.backward }
  end
end
