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

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| item_name   | text       | null: false       |
| description | text       | null: false       |
| price       | integer    | null: false       |
| condition   | text       | null: false       |
| burden      | boolean    | null: false       |
| area        | string     | null: false       |
| period      | datetime   | null: false       |
| category    | text       | null: false       |
| user        | references | foreign_key: true |

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
| postcode      | integer    | null: false       |
| prefecture_id | text       | null: false       |
| city          | text       | null: false       |
| block         | integer    | null: false       |
| building      | text       | null: false       |
| phone_number  | integer    | null: false       |
| purchase      | references | foreign_key: true |

### Association

- belongs_to : users
- belongs_to : items
- has_one : purchases
- has_many : comments

## comments テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| text     | text   | null: false |

### Association

- belongs_to : users
- belongs_to : items
