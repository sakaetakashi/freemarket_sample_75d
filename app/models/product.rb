class Product < ApplicationRecord

  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :categories, dependent: :destroy
  
end
