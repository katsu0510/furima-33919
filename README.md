# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------  | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| k_first_name          | string | null: false |
| k_last_name           | string | null: false |
| birth_day             | date   | null: false |

### Association

- has_many :items dependent: :destroy
- has_many :comments dependent: :destroy
- belongs_to :destination dependent: :destroy
- belongs_to :card dependent: :destroy





## item テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references |                                |
| name          | string     | null: false                    |
| description   | string     | null: false                    |
| category_id   | text       | null: false                    |
| state_id      | string     | null: false                    |
| ship_cost_id  | string     | null: false                    |
| source_area_id| string     | null: false                    |
| ship_day_id   | string     | null: false                    |
| price         | string     | null: false                    |


### Association

- has_many :comments
- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- has_many :images dependent: :destroy
- has_one :category dependent: :destroy




## category テーブル

| Column     | Type       | Options                        |
| -----------| ---------- | ------------------------------ |
| name       | string     | null: false                    |
| ancestry   | string     |                                |


## Association

- has_many :items


## destination テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| user          | references | null: false                    |
| post_code     | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |


### Association

- belongs_to :user
