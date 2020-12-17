FactoryBot.define do
  factory :item do
    name                 {Faker::Name.initials(number: 2)}
    description          {Faker::Alphanumeric.alphanumeric(number: 10)}
    price                {Faker::Number.between(from: 300, to: 9999999)}
    category_id          {Faker::Number.between(from: 2, to: 11)}
    condition_id         {Faker::Number.between(from: 2, to: 7)}
    delivery_fee_id      {Faker::Number.between(from: 2, to: 3)}
    delivery_area_id     {Faker::Number.between(from: 2, to: 48)}
    delivery_day_id      {Faker::Number.between(from: 2, to: 4)}
     
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
