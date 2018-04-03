# README
# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false, unique:true|
|birthday|integer|null: false|
|residence|string|null:false|
|gender|integer|null:false|

### Association

- has_many :images
- has_many :groups
- has_one  :profile
- has_one :female
- has_one :man
- has_many :communities, through: :members

## user_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string||
|user_id|references|null: false, foreign_key:true|
|status|integer||

### Association

- belongs_to :user

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|
|age|integer||

### Association

- belongs_to :user

## malesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|

### Association

- has_many :followers, through: :relationships
- belongs_to :user

## femalesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|

### Association

- has_many :followings, through: :relationships
- belongs_to :user

## relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|like_man|references|null: false, foreign_key:true|
|like_female|references|null: false, foreign_key:true|
|match_male_id|referances|null: false, foreign_key:true|
|match_female_id|referances|null: false, foreign_key:true|

### Association

- belongs_to :man
- belongs_to :female


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|rerationsships_id|integer|null: false, foreign_key:true|
|image_url|string||

### Association

- belongs_to :relationships

## communitiesテーブル

|Column|Type|Options|
|------|----|-------|
|category|integer|null: false|
|community_name|string|null: false|
|image|string|null: false|

### Association

- has_many :users, through: :members

## membersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|community|references|null: false, foreign_key: true|

### Association

- belongs_to :community
- belongs_to :user
