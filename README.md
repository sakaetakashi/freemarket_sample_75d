# README

users_model
  family_name |string|
  first_name  |string|
  family_name_kana |string|
  first_name_kana  |string|
  nickname  |string|
  email     |text|
  password  |text|
  birthday  |date|

aderess_model 
  post_code  |integer|
  prefecture |string|
  city  |string|
  block  |string|
  building  |text|
  telephone_number  |integer|
  user_id  |integer|

products_model
  product_name  |text|
  category  |string|
  image  |text|
  explain  |text|
  price  |integer|
  size  |string|
  bland |text|
  condition  |text|
  color  |string|
  arrive_at  |date|
  shipping_method  |string|
  user_id  |integer|
  
credit_card
  card_name  |string|
  card_number  |integer|
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
