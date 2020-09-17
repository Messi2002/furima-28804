FactoryBot.define do
  factory :purchase_order do
    association :user
    association :item

    token                 { 12345 }
    postal_code           { '123-4567' }
    prefecture            { 1 }
    city                  { '東京都' }
    house_number          { '1-1' }
    building_name         { '東京ハイツ' }
    phone_number          { '99999999999' }
    purchase_id           { 1 }
    

  end
end
