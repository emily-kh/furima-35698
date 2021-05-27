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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| birthday | string | null: false |

### Association

- has_many : items
- has_many : purchases

## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| itemname | string | null: false |
| category | string | null: false |
| price    | string | null: false |
| seller   | string | null: false |


### Association

- belongs_to : users
- has_one : purchases


## purchases テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| buyer   | string     | null: false |
| address | string     | null: false |

### Association

- belongs_to : users
- belongs_to : items