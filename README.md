# README


# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| ----------------------| ------ | ----------- |
| email                 | string | null: false ,unique: true|
| password              | string | null: false |
| password confirmation	| string | null: false |

### Association
- has_many :items
- has_many :comment
- has_one :profile

## profile テーブル

 Column             | Type       | Options     |
| ------------------| -----------| ----------- |
| first_name        | string     | null: false |
| family_name       | string     | null: false |
| first_name_kana   | string     | null: false |
| nickname              | string | null: false |
| family_name_kana  | string     | null: false |
| birth_year        | date       | null: false |
| birth_mouth       | date       | null: false |
| birth_day         | date       | null: false |
| user_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## item テーブル

| Column             | Type   | Options     |
| -------------------| ------ | ----------- |
| item               | string | null: false |
| introduction       | text   | null: false |
| image              | string | null: false |
| detail             | text   | null: false |
| category           | string | null: false |
| status             | string | null: false |
| price              | integer| null: false |
| postage_payer	     | string | null: false |
| preparation_day    | string | null: false |
| ship_location      | string | null: false |
| user_id            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :purchase
- has_many :comment

 
## purchase テーブル

| Column           | Type       |   Options   |
| -----------------| -----------|-------------|
| card_number      | integer	  | null: false |
| expiration_year  | integer    | null: false |
| expiration_mouth | integer	  | null: false |
| expiration_day   | integer	  | null: false |
| security_code    | integer	  | null: false |
| item_id          | references | null: false, foreign_key: true |

### Association

- bas_one :address
- belongs_to :item


## address テーブル
| Column        | Type       | Options     |
| --------------| ------     | ------------|
| postal_code   | integer(7) | null: false |
| prefectures   | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     | null: false |
| tel           | string     | null: false |
|item_id        | string     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

