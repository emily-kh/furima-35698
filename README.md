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

| Column        | Type     | Options      |
| ------------- | -------- | ------------ |
| nickname      | string   | null: false  |
| email         | string   | unique: true |
| password      | string   | null: false  |
| last_name     | string   | null: false  |
| first_name    | string   | null: false  |
| last_name_fu  | string   | null: false  |
| first_name_fu | string   | null: false  |
| date          | datetime | null: false  |

### Association

- has_many : items
- has_many : purchases
- has_one : address
- has_many : comments

## items テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| itemname  | text       | null: false       |
| price     | integer    | null: false       |
| user      | references | foreign_key: true |
| category  | text       | null: false       |
| condition | text       | null: false       |
| area      | string     | null: false       |
| period    | datetime   | null: false       |


### Association

- belongs_to : users
- has_one : purchases
- has_one : address
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
| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

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
