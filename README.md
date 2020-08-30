# README


# テーブル設計

## users テーブル
| Column                | Type       | Options     |
| ----------------------| -----------|------------ |
| email                 | string     | null: false ,unique: true|
| password              | string     | null: false |
| password confirmation	| string     | null: false |
| first_name            | string     | null: false |
| family_name           | string     | null: false |
| first_name_kana       | string     | null: false |
| nickname              | string     | null: false |
| family_name_kana      | string     | null: false |
| birthday              | date       | null: false |

### Association
- has_many :items
- has_many :purchases
- has_many :comments


## itemsテーブル

| Column             | Type   | Options     |
| -------------------| ------ | ----------- |
| item               | string | null: false |
| introduction       | text   | null: false |
| image              | string | null: false |
| detail             | text   | null: false |
| category           | integer| null: false |
| status             | integer| null: false |
| price              | integer| null: false |
| postage_payer_id   | integer| null: false |
| preparation_day_id | integer| null: false |
| ship_location_id   | integer| null: false |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one ;purchase
- has_many :comments


## purchases テーブル
| Column             | Type   | Options     |
| -------------------| ------ | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association
- bas_one :addresses
- belongs_to :item
- belongs_to :user



## addresses テーブル
| Column        | Type       | Options     |
| --------------| ------     | ------------|
| postal_code   | string     | null: false |
| prefectures   | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     | null: false |
| tel           | string     | null: false |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase


## comments テーブル
| Column        | Type        | Options    |
| --------------| -----------| ------------|
| comment       | text       | null: false |
| user          |references | null: false, foreign_key: true |
| item          |references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user


