# テーブル設計

## usersテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| name             | string | null: false |
| name_kana        | string | null: false |
| birth_day        | date   | null: false |


### Association

- has_many :exhibits
- has_many :purchases

## itemsテーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| exhibit_name | string     | null: false |
| description  | text       | null: false |
| category     | string     | null: false |
| condition    | string     | null: false |
| charges      | string     | null: false |
| source       | string     | null: false |
| days         | integer    | null: false |
| price        | integer    | null: false |
| user         | references |             |
| purchase     | references |             |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| card_number     | integer    | null: false |
| expired_date    | date       | null: false |
| security_number | integer    | null: false |
| post_code       | integer    | null: false |
| address         | string     | null: false |
| phone_number    | integer    | null: false |
| user            | references |             |
| purchase        | references |             |

### Association

- belongs_to :user
- belongs_to :exhibit