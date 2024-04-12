# ポケモンマッチングアプリ 〜ポケとも〜

## 概要

ポケモンマッチングアプリ 〜ポケとも〜 は、ポケモンユーザー同士が出会い、交流するためのマッチングアプリです。
現代ポケモンユーザーと繋がれるアプリといえば X(旧 Twitter)や掲示板などが主流です。
X とはユーザーがたくさんいてどの人に絡みにいけばいいのかわからない、また人見知りでなかなか絡みに行く勇気が出ないというユーザーを対象にしております。
掲示板アプリとは一回遊んだユーザーと再度遊ぶのが難しいというところに課題を見つけました。

## 特徴

- ポケモンユーザー同士のマッチングが可能です。
- ユーザープロフィールを作成し、共通の趣味や興味を共有します。
- チャット機能を通じてコミュニケーションを取ります。
- ポケモンに関するイベントや情報を共有します。

## 使用技術

- Ruby on Rails
- HTML/CSS
- JavaScript

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
- belongs_to :match
