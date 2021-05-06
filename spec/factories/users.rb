FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { Faker::Name.initials(number: 2) }
    last_name             { Faker::Name.initials(number: 2) }
    first_name_kana       { 'カタカナ' }
    last_name_kana        { 'カタカナ' }
    birthday              { Faker::Date.backward }
  end
end
