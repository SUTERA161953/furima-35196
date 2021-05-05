# テーブル設計

## users テーブル

| Column          | Type    | Options                   |
| --------------- | ------- | ------------------------- |
| name            | string  | null: false               |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| first_name      | string  | null: false               |
| last_name       | string  | null: false               |
| first_name_kana | string  | null: false               |
| last_name_kana  | string  | null: false               |
| birthday        | integer | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | string     | null: false                    |
| item        | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| charge      | string     | null: false                    |
| area        | string     | null: false                    |
| days        | string     | null: false                    |
| price       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one    :buys

## buys テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :ships

## ships テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefectures  | string  | null: false |
| municipality | string  | null: false |
| address      | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

### Association

- belongs_to :buys