# テーブル設計

## users テーブル

| Column                | Type   | Options                  |
| --------------------  | ------ | -----------              |
| nickname              | string | null: false              |      
| email                 | string | null: false unique: true |
| encrypted_password    | string | null: false              |
| first_name            | string | null: false              |
| last_name             | string | null: false              |
| k_first_name          | string | null: false              |
| k_last_name           | string | null: false              |
| birth_day             | date   | null: false              |

### Association

- has_many :orders dependent: :destroy
- has_many :items dependent: :destroy





## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| state_id      | integer    | null: false                    |
| ship_cost_id  | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| ship_day_id   | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| price         | integer    | null: false                    |


### Association
- belongs_to :user
- has_one :order dependent: :destroy








## orders テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| item      | references     | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination dependent: :destroy





## destination テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order | references | null: false, foreign_key: true |

### Association

- belongs_to :order


