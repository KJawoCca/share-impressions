# 概要

ユーザー投稿型のレビューサイト。対象はフリーウェア（フリーゲーム）。

# 本番環境

http://35.72.248.72/

ログイン情報（テスト用）
- Eメール：test@test.com
- パスワード：testtest

# 制作背景（意図）

手軽に投稿できるレビューサイトがあったらいいなと考えたことがきっかけで制作しています。
現状、フリーゲームのレビューはアプリダウンロードサイトのレビュー欄もしくは個人ブログが主流になっています。
前者はサイト内の作品ページに紐づいているため、予め作品に興味を持っていないと閲覧する機会に乏しいです。
後者はライトユーザーには少し敷居が高いように感じます。
上記の問題点をクリアして、ユーザー参加型の使いやすいレビューサイトのプラットフォームを提供することが目的です。
閲覧者の持つニーズが特定のタイトルの情報ではなく、「アクションゲームがやりたい」「ほのぼのした作風に触れたい」など、漠然としていることを想定しています。

# 使用技術（開発環境）

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
JavaScript, JQuery, Bootstrap

## データベース
MySQL

## インフラ
AWS(EC2)

## webサーバ（本番環境）
nginx

## アプリケーションサーバ（本番環境）
unicorn

## テスト
RSpec

## エディタ
VSCode

# 今後実装したい機能

- タグ機能
- ユーザー個人ページ

# DB設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| name              | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| self_introduction | text   |             |

### Association

- has_many :reviews
- has_many :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| review | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :review

## reviews テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| title           | string     | null: false                   |
| opus_title      | string     | null: false                   |
| author_name     | string     | null: false                   |
| authors_website | string     |                               |
| text            | text       | null:false                    |
| user            | references | null:false, foreign_key: true |
|                 |            |                               |

### Association

- belongs_to :user
- has_many :comments
- has_many :tag_maps
- has_many :tags, through: tag_maps

## tag_maps テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| review | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |
|        |            |                                |

### Association

- belongs_to :review
- belongs_to :tag

## tags テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| name      | string | null: false |
| attribute | string |             |
|           |        |             |

### Association

- has_many :tag_maps
- has_many :reviews, through: tag_maps

