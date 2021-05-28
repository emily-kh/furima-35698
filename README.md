# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## users テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | null: false,unique: true |
| encrypted_password | string   | null: false              |
| last_name          | string   | null: false              |
| first_name         | string   | null: false              |
| last_name_kana     | string   | null: false              |
| first_name_kana    | string   | null: false              |
| birthday           | date     | null: false              |

### Association

- has_many : items
- has_many : purchases
- has_many : comments

## items テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| name           | string     | null: false       |
| description    | text       | null: false       |
| price          | integer    | null: false       |
| condition_id   | integer    | null: false       |
| burden_id      | integer    | null: false       |
| area_id        | integer    | null: false       |
| period_id      | integer    | null: false       |
| category_id    | integer    | null: false       |
| user           | references | foreign_key: true |

### Association

- belongs_to : users
- has_one : purchase
- has_many : comments

## purchases テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to : users
- belongs_to : items
- has_one : address
- has_many : comments

## address テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postcode      | string     | null: false       |
| area_id       | integer    | null: false       |
| city          | string     | null: false       |
| block         | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| purchase      | references | foreign_key: true |

### Association

- belongs_to : purchases
- has_many : comments

## comments テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| text     | text   | null: false |

### Association

- belongs_to : users
- belongs_to : items
