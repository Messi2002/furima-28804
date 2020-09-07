FactoryBot.define do
  factory :item do
    # item                  { Faker::Base.regexify("[aあ]{40}")}
    # introduction          { Faker::Base.regexify("[aあ]{1000}")}
    item { 'アイテム' }
    introduction          { '説明' }
    category_id           { 2 }
    status_id             { 2 }
    price                 { 9_999_999 }
    postage_payer_id      { 2 }
    preparation_day_id    { 2 }
    ship_location_id      { 2 }
    detail                { 2 }
    # id                    {1}
    # created_at            {'20200905'}
    # updated_at            {'20200905'}
  end
end
