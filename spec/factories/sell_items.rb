FactoryBot.define do
  factory :sell_item do
    
    postal_code              { '123-4567' }
    delivery_area_id     {Faker::Number.between(from: 2, to: 48)}
    city                      {Gimei.city.kanji }
    address                   {Gimei.town.kanji}
    building_name            { '東京ハイツ' }
    phone_number            {Faker::Number.number(11)}

   
    association :user
    association :item
  end
end
