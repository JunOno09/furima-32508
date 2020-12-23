FactoryBot.define do
  factory :purchase_management do

    postal_code              {}
    city                      {Gimei.city.kanji  }
    address                   {Gimei.town.kanji}
    building_name            { '東京ハイツ' }
    phone_number            {}

  association :user
  association :item
  end
end
