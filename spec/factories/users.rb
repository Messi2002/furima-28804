FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '漢字カタカナひらがなAa' }
    family_name           { '漢字カタカナひらがなAa' }
    first_name_kana       { 'カタカナ' }
    family_name_kana      { 'カタカナ' }
    birthday              { Faker::Date.birthday }
  end
end
