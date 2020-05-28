class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category, dependent: :destroy
  belongs_to :user
  belongs_to :buyer, class_name: "User"
end