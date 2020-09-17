FactoryBot.define do
  factory :item do
    association :user

    item { 'アイテム' }
    introduction          { '説明' }
    category_id           { 2 }
    status_id             { 2 }
    price                 { 9_999_999 }
    postage_payer_id      { 2 }
    preparation_day_id    { 2 }
    ship_location_id      { 2 }

  end
end
