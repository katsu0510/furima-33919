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

- has_one :purchase_management dependent: :destroy
- has_many :items dependent: :destroy




## item テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | string     | null: false                    |
| category_id   | integer    | null: false                    |
| state_id      | integer    | null: false                    |
| ship_cost_id  | integer    | null: false                    |
| source_area_id| integer    | null: false                    |
| ship_day_id   | integer    | null: false                    |
| user_id       | string     | null: false                    |


### Association
- belongs_to :user
- has_one :purchase_management dependent: :destroy








## purchase_management テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| item_id       | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |




### Association

- belongs_to :user
- belongs_to :item

