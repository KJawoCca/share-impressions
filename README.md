# テーブル設計

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

