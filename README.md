# freemarket_sample_75d DB設計図

## userテーブル
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
- has_many :addresses, dependent: :destroy

## addressテーブル
|Column|Type|Option|
|------|----|------|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|text|null: false|
|telephone_number|integer|null: false|
|user_id|bigint|null: false|
- belongs_to :user

## productテーブル
|Column|Type|Option|
|------|----|------|
|product_name|string|null: false|
|explain|text|null: false|
|price|integer|null: false|
|brand|string||
|arrive_at|string|null: false|
|condition|text|null: false|
|shipping_fee|string|null: false|
|region_id|integer|null: false|
|user_id|reference|null: false, foreign_key: true|
|buyer_id|reference|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
- belongs_to :user
- has_many :images, dependent: :destroy
- belongs_to :category, dependent: :destroy
- belongs_to :buyer, class_name: "User"
- belongs_to_active_hash :region


## imageテーブル
|Column|Type|Option|
|------|----|------|
|src|string|null: false|
|product_id|bigint|null: false, foreign_key: true|
- belongs_to :product

## credit_cardテーブル
|Column|Type|Option|
|------|----|------|  
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
- belongs_to :user


## categoryテーブル
|Column|Type|Option|
|------|----|------|  
|name|string|null: false|
|ancestry|string|null: false|
- belongs_to :product
- has_ancestry


