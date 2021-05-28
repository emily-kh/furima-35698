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
- has_many : purchase_users
- has_many : comments

## items テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| name           | string     | null: false       |
| description    | text       | null: false       |
| price          | integer    | null: false       |
| condition_id   | integer    | null: false       |
| burden_id      | integer    | null: false       |
| prefecture_id  | integer    | null: false       |
| period_id      | integer    | null: false       |
| category_id    | integer    | null: false       |
| user           | references | foreign_key: true |

### Association

- belongs_to : user
- has_one : purchase_user
- has_many : comments


## purchase_user テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : address
- has_many : comments

## addresses テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postcode      | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| block         | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| purchase_user | references | foreign_key: true |

### Association

- belongs_to : purchase_user

## comments テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| text     | text       | null: false |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
