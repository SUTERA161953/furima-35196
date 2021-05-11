FactoryBot.define do
  factory :buy_ship do
    postal_code  { '123-4567' }
    area_id      { 2 }
    municipality { '横浜市緑区' }
    address      { '番地' }
    building     { '柳ビル103' }
    phone_number { '09012345678' }
    token        {"tok_abcdefghijk00000000000000000"}
  end
end