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
- has_many :products, dependent: :destroy
- has_one :credit_cards, dependent: :destroy
- has_many :adresses, dependent: :destroy

##addressテーブル
|Column|Type|Option|
|------|----|------|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|text|null: false|
|telephone_number|integer|null: false|
|user_id|integer|null: false|
- belongs_to :user

##productテーブル
|Column|Type|Option|
|------|----|------|
|product_name|text|null: false|
|category|string|null: false|
|explain|text|null: false|
|price|integer|null: false|
|brand|string||
|condition|text|null: false|
|shipping|text|null: false|
|shipping_method|string|null: false|
|shipping_fee|integer|null: false|
|region|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
- belongs_to :user
- has_many :images, dependent: :destroy
- has_many :categories, dependent: :destroy


##imageテーブル
|Column|Type|Option|
|------|----|------|
|image|text|null: false|
|product_id|integer|null: false, foreign_key: true|
- belongs_to :product

##credit_cardテーブル
|Column|Type|Option|
|------|----|------|  
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
belongs_to :user


##categoryテーブル
|Column|Type|Option|
|------|----|------|  
|name|string|null: false|
|ancestry|string|null: false|
- belongs_to :product
- has_many :ancestry


