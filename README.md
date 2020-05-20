# README

#freemarket_sample_75d DB設計図

##userテーブル
|Column|Type|Option|
|------|----|------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|nickname|string|null: false|
|email|text|null: false|
|password|text|null: false|
|birthday|date|null: false|
- has_many :adresses
- has_many :products
- has_many :credits
- belongs_to :adress

##aderessテーブル
|Column|Type|Option|
|------|----|------|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|text|null: false|
|telephone_number|integer|null: false|
|user_id|integer|null: false|
- has_many :users

##productテーブル
|Column|Type|Option|
|------|----|------|
|product_name|text|null: false|
|category|string|null: false|
|explain|text|null: false|
|price|integer|null: false|
|brand|text||
|condition|text|null: false|
|arrive_at|date|null: false|
|shipping_method|string|null: false|
|shipping_fee|integer|null: false|
|region|string|null: false|
|user_id|integer|null: false, foreign_key: true|
- belongs_to :user
- has_many :images


##imageテーブル
|Column|Type|Option|
|------|----|------|
|image|text|null: false|
|product_id|integer|null: false, foreign_key: true|
- belongs_to :product

##credit_cardテーブル
|Column|Type|Option|
|------|----|------|  
|card_owner|string|null: false|
|card_number|integer|null: false|
|limit_month|date|null: false|
|limit_year|date|null: false|
|security_code|integer|null: false|
|company|string|null: false|
|user_id|integer|null: false, foreign_key: true|
- belongs_to :user





