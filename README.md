# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickName           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| profile            | text    |                           |
| age_id             | integer | null: false               |
| sex_id             | integer | null: false               |
| status_id          | integer | null: false               |
| favorite_title_id  | integer | null: false               |
| phone_number       | integer | null: false               |
| icon_id            | integer | null: false               |

### Association

- has_many :messages
- has_many :matches

## matches テーブル(users テーブルの中間テーブル)

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| likes_id | references | null: false, foreign_key: true |
| liked_id | references | null: false, foreign_key: true |

- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| match   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
