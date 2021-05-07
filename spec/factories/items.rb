FactoryBot.define do
  factory :item do
    name        {Faker::Name.initials(number: 2) }
    description {Faker::Lorem.sentence}
    category_id {2}
    status_id   {2}
    charge_id   {2}
    area_id     {2}
    days_id     {2}
    price       {300}
    
    association :user

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end