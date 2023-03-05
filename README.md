#テーブル設計

## users テーブル

| Column                    | Type    | Option                      |
| ------------------------- | ------- | --------------------------- |
| nickname                  | string  | null: false                 |
| email                     | string  | null: false,  unique: true  |
| encrypted_password        | string  | null: false                 |
| last_name                 | string  | null: false                 |
| first_name                | string  | null: false                 |
| kana_last_name            | string  | null: false                 |
| kana_first_name           | string  | null: false                 |
| birthday                  | date    | null: false                 |


### Association

- has_many :items
- has_many :orders

-----------------------------------------------------------------------------------
## items テーブル

| Column               | Type        | Option                          |
| -------------------- | ----------- | ------------------------------- |
| name                 | string      | null: false                     |
| explain              | text        | null: false                     |
| category_id          | string      | null: false                     |
| condition_id         | string      | null: false                     |
| shipping_charge_id   | string      | null: false                     |
| shipping_region_id   | string      | null: false                     |
| shipping_days_id     | string      | null: false                     |
| price                | integer     | null: false                     |
| user                 | references  | null: false, foreign_key: true  |

# imageはActiveStorageにて実装する

### Association

- belongs_to :user
- has_one :order

-----------------------------------------------------------------------------------
## orders テーブル

| Column                | Type        | Option                          |
| --------------------- | ----------- | ------------------------------- |
| item                  | references  | null: false, foreign_key: true  |
| user                  | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order_info

-----------------------------------------------------------------------------------

## order_infosテーブル

| Column                 | Type        | Option                          |
| ---------------------- | ----------- | ------------------------------- |
| post_code              | string      | null: false                     |
| prefecture_id          | integer     | null: false                     |
| municipalities         | string      | null: false                     |
| address                | string      | null: false                     |
| building               | string      |                                 |
| phone_number           | string      | null: false                     |
| order                  | references  | null: false, foreign_key: true  |

### Association

- belongs_to :order