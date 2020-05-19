# README

+users_model
  family_name |string|null
  first_name  |string|null
  family_name_kana |string|null
  first_name_kana  |string|null
  nickname  |string|null
  email     |text|null
  password  |text|null
  birthday  |date|null

+user_adress_model
  user_id  |integer|
  adress_id  |integer|

+aderess_model 
  post_code  |integer|null
  prefecture |string|null
  city  |string|null
  block  |string|null
  building  |text|
  telephone_number  |integer|null

+products_model
  product_name  |text|null, false
  category  |string|null, false
  explain  |text|null, false
  price  |integer|null, false
  bland |text|
  condition  |text|null, false
  arrive_at  |date|null, false
  shipping_method  |string|null, false
  shipping_fee  |integer|null, false
  region  |string|null, false
  user_id  |integer|null, false
  image_id  |integer|null, false

+image_model
  image|text|null
  
+credit_card
  card_name  |string|
  card_number  |integer|null, false
  limit_month  |date|
  limit_year  |date|
  security_code  |integer|
  company  |string|
  user_id  |integer|
 




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
